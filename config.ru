require "sidekiq"

Sidekiq.configure_client do |client|
  client.redis = {size: 1}
end

require "sidekiq/web"
run Sidekiq::Web
