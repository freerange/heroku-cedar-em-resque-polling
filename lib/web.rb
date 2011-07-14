require 'sinatra'
require 'resque'

require 'job'

get '/' do
  Resque.enqueue(Job)
  "Job queued"
end