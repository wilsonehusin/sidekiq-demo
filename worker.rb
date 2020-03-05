require "sidekiq"

Sidekiq.configure_client do |client|
  client.redis = {db: 0}
end

Sidekiq.configure_server do |server|
  server.redis = {db: 0}
end

class SloppyWorker
  include Sidekiq::Worker

  def perform
    puts "Accepted job!"
    sleep rand(5..9)
    puts "Starting job!"

    raise "Ah the conveyor belt got stuck!" if rand(2) == 1

    puts "Finished job!"
  end
end
