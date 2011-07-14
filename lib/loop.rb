require "eventmachine"
require "resque"
require "job"

queue, interval = ENV['QUEUE'], ENV['INTERVAL']
puts "Starting worker for queue: #{queue}; and with polling interval: #{interval}..."
EventMachine::run {
  EventMachine::add_periodic_timer(interval) do
    if job = Resque::Job.reserve(queue)
      job.perform
    end
  end
}