require 'active_resource'

module RiotGames
  class Match < ActiveResource::Base
    include RiotApiResource

    self.site = 'https://euw.api.pvp.net/api/lol/euw/v2.2/'
    self.collection_name = 'match'
    self.include_format_in_path = false
    self.logger = Logger.new(STDERR) if Rails.env == 'development'

    def winner
      teams.detect { |t| t.winner }.teamId
    end

    def dragons
      teams.sum(&:dragonKills)
    end

    def barons
      teams.sum(&:baronKills)
    end

    def largest_killing_spree
      participants.map { |p| p.stats.largestKillingSpree }.max
    end

    def largest_multi_kill
      participants.map { |p| p.stats.largestMultiKill }.max
    end
  end
end
