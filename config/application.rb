require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module CineMarket
  class Application < Rails::Application
    config.load_defaults 8.1

    config.autoload_lib(ignore: %w[assets tasks])

    config.active_storage.variant_processor = :vips
  end
end