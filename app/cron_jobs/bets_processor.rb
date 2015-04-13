require 'riot_games/random_match'

class BetsProcessor
  LOCK_FILE = 'tmp/bets.lock'

  def run!
    file_append_line '<strong>Betting is temporarily locked.</strong> You can neither place nor cancel bets while winnings are calculated.'
    file_append_line

    Bet.transaction do
      match = random_match
      bets = Bet.current
      file_append '<strong>Calculating winnings</strong>'
      bets.each do |bet|
        file_append('.')
        bet.process! match
      end
    end

    File.delete LOCK_FILE
  end

  private

  def random_match
    match_id = nil
    loop do
      match_id = RiotGames::RandomMatch.new.pop
      break unless match_id.nil?
    end

    file_append_line "<strong>Getting match information</strong> (#{match_id})..."
    riot_match = RiotGames::Match.find(match_id)

    Match.create!(
      id: riot_match.matchId,
      winner: riot_match.winner,
      dragons: riot_match.dragons,
      barons: riot_match.barons,
      killing_spree: riot_match.largest_killing_spree,
      multi_kill: riot_match.largest_multi_kill
    )
  end

  def file_append_line(line = '')
    file_append line + "\n"
  end

  def file_append(line)
    File.open(LOCK_FILE, 'a') do |f|
      f.write line
    end
  end
end