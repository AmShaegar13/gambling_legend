require 'riot_games/random_match'

class BetsProcessor
  LOCK_FILE = 'tmp/bets.lock'

  def initialize
    file_append("<strong>Betting is temporarily locked.</strong> You can neither place nor cancel bets while winnings are calculated.\n")
    match_id = RiotGames::RandomMatch.new.pop

    file_append("<strong>Getting match information</strong> (#{match_id})...")
    @match = RiotGames::Match.find(match_id)
  end

  def run!
    pp Bet.where(match: nil)
    sleep 20

    File.delete LOCK_FILE
  end

  private

  def file_append(line)
    File.open(LOCK_FILE, 'a') do |f|
      f.write(line + "\n")
    end
  end
end