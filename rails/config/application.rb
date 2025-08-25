require_relative "boot"

require "rails"

require "active_model/railtie"
require "active_job/railtie"
# require "active_record/railtie"  # Using MongoDB instead
# require "active_storage/engine"  # Not needed for MVP
require "action_controller/railtie"
require "action_view/railtie"

# Load delayed_job for background processing
require "delayed_job_mongoid"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Dandelion
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])
  end
end
