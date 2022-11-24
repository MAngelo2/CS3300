require 'rails_helper'

RSpec.feature "Creating an account", type: :feature do
  scenario "The visitor should be able to make an account" do
    visit root_path
    click_link "Sign up"
  end
end
