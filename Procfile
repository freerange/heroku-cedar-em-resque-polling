web: bundle exec ruby -Ilib lib/web.rb -p $PORT
worker: bundle exec rake resque:work QUEUE=job INTERVAL=0.5 --trace