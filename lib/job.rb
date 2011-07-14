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

