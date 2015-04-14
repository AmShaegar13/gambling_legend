require 'active_resource'

module RiotGames
  class Match < ActiveResource::Base
    include RiotApiResource

    self.site = 'https://euw.api.pvp.net/api/lol/euw/v2.2/'
    self.collection_name = 'match'
    self.include_format_in_path = false
    self.logger = Logger.new(STDERR) if Rails.env == 'development'

    def winner
      team_id = teams.detect { |t| t.winner }.teamId

      case team_id
      when 100
        BetChoice.find_by(label: 'TEAM_BLUE')
      when 200
        BetChoice.find_by(label: 'TEAM_RED')
      else
        nil
      end
    end

    def dragons
      dragons = teams.sum(&:dragonKills)

      case dragons
      when 0
        BetChoice.find_by(label: 'NO_DRAGONS')
      when 1..4
        BetChoice.find_by(label: "DRAGONS_#{dragons}")
      else
        BetChoice.find_by(label: 'DRAGONS_5+')
      end
    end

    def barons
      barons = teams.sum(&:baronKills)

      case barons
      when 0
        BetChoice.find_by(label: 'NO_BARONS')
      when 1
        BetChoice.find_by(label: 'BARONS_1')
      else
        BetChoice.find_by(label: 'BARONS_2+')
      end
    end

    def largest_killing_spree
      killing_spree = participants.map { |p| p.stats.largestKillingSpree }.max

      case killing_spree
      when 0..2
        BetChoice.find_by(label: 'NO_KILLING_SPREE')
      when 3..7
        BetChoice.find_by(label: "KILLING_SPREE_#{killing_spree}")
      else
        BetChoice.find_by(label: 'KILLING_SPREE_8+')
      end
    end

    def largest_multi_kill
      multi_kill = participants.map { |p| p.stats.largestMultiKill }.max

      case multi_kill
      when 0, 1
        BetChoice.find_by(label: 'NO_MULTIKILL')
      when 2..4
        BetChoice.find_by(label: "MULTIKILL_#{multi_kill}")
      else
        BetChoice.find_by(label: 'MULTIKILL_5+')
      end
    end
  end
end
