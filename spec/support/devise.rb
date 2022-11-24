module FeatureHelper
  def sign_in
    @user = FactoryBot.create(:user)
    visit '/'
    click_link 'Login'
    fill_in email_field, with: @user.email
    fill_in password_field, with @user.password
    click_button "Log in"
  end
end

RSpec.configure do |config|
    config.include FeatureHelper, :type => :feature
    config.include Devise::Test::ControllerHelpers, type: :controller
    config.include Devise::Test::ControllerHelpers, type: :view
  end