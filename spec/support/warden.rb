include Warden::Test::Helpers

RSpec.configure do |config|
  config.before(:suite) do
    Warden.test_mode!
  end

  config.before(:each) do
    Warden.test_reset! 
  end
end
