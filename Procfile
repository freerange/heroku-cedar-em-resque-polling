web: bundle exec ruby -Ilib lib/web.rb -p $PORT
worker: bundle exec sh -c "QUEUE=job INTERVAL=0.5 ruby -Ilib lib/loop.rb"