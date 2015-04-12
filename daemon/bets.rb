require 'daemons'

Daemons.run_proc('bets.rb') do
  require_relative '../config/environment.rb'

  INTERVAL = 600
  processor = BetsProcessor.new

  loop do
    sleep(INTERVAL - Time.now.to_i % INTERVAL)
    processor.run!
  end
end
