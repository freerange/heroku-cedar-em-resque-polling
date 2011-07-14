require "resque"
ENV["REDISTOGO_URL"] ||= "redis://redistogo:e0118abf0de6069ff50f980889ae451e@catfish.redistogo.com:9456/"
uri = URI.parse(ENV["REDISTOGO_URL"])
Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)

class Job
  class << self
    def queue
      "job"
    end
    def perform(*args)
      puts "*** Processing Job with #{args.inspect}"
    end
  end
end

