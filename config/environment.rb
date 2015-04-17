require 'pp'

# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

Thread.new do
  INTERVAL = 600
  processor = BetsProcessor.new

  loop do
    sleep(INTERVAL - Time.now.to_i % INTERVAL)

    # do not die on error
    processor.run! rescue nil
  end
end

at_exit do
  File.delete BetsProcessor::LOCK_FILE
end
