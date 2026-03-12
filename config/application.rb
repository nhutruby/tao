require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
# require "active_record/railtie"
# require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Tao
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
    config.action_controller.perform_caching = true
    # Change to :null_store to avoid any caching.
    cache_servers = (7000..7005).map { |port| "redis://127.0.0.1:#{port}" }
    config.cache_store = :redis_cache_store, {
      redis:  Redis::Cluster.new(nodes: (7000..7005).map { |port| "redis://127.0.0.1:#{port}" }),

                                               connect_timeout:    30,  # Defaults to 1 second
                                               read_timeout:       0.2, # Defaults to 1 second
                                               write_timeout:      0.2, # Defaults to 1 second
                                               reconnect_attempts: 2,   # Defaults to 1
                                               error_handler: ->(method:, returning:, exception:) {
                                                 Rails.logger.error("[Redis Cache Error] Method: #{method}, Returning: #{returning}, Exception: #{exception.message}")
                                               }
    }
  end
end
