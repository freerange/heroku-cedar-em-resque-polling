require 'sinatra'
require 'resque'

require 'job'

get '/' do
  Resque.enqueue(Job)
  "Job currently queued: #{Resque.size(Job.queue)}"
end