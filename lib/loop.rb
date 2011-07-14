require "eventmachine"
require "resque"
require "job"

queue, interval = ENV['QUEUE'] || Job.queue, ENV['INTERVAL'] || 5
puts "Starting worker for queue: #{queue}; and with polling interval: #{interval}..."
EventMachine::run {
  EventMachine::add_periodic_timer(interval) do
    if job = Resque::Job.reserve(queue)
      puts "Performing job..."
      job.perform
      puts "...done."
    else
      puts "No job found."
    end
  end
}