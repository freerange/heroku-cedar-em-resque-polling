require 'sinatra'
require 'resque'

require 'job'

get '/' do
  "Jobs currently queued: #{Resque.size(Job.queue)}"
end

get '/enqueue' do
  Resque.enqueue(Job)
  "Job queued successfully."
end