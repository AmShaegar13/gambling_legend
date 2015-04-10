namespace :cron do
  desc "Process winnings calculation."
  task bets: :environment do
    BetsProcessor.new.run!
  end
end
