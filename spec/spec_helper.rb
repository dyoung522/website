require 'webmock/rspec'
require 'support/session_helper'

# http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
  end

  config.order = :random

  config.include SessionHelper, :type => :controller
end

WebMock.disable_net_connect!(allow_localhost: true)

def log_in_as_admin
  controller.session[:user_id] = create(:user, admin: true).id
end