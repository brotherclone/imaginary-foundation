require File.expand_path('../boot', __FILE__)

require 'rails/all'


Bundler.require(*Rails.groups)

module ImaginaryFoundation
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework :rspec,
                       :fixtures => true,
                       :view_specs => false,
                       :helper_specs => false,
                       :routing_specs => false,
                       :controller_specs => true,
                       :request_specs => true
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end
    config.assets.precompile += ['styleguide.html']
    config.serve_static_assets = true
  end
end
