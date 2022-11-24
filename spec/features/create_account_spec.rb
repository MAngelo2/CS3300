require 'rails_helper'

RSpec.feature "Creating an account", type: :feature do

  context "Create new account" do
    scenario "The visitor should be able to make an account" do
      visit root_path
      click_link "Sign up"
      fill_in "Email", with: "testemail@test.com"
      fill_in "Password", with: "testing"
      fill_in "Password confirmation", with: "testing"
      click_button "Sign up"
      expect(page).to have_content("Welcome! You have signed up successfully.")
    end
  end

  context "Logging out and in"
    let(:user) {FactoryBot.create(:user)}

    scenario "The user should be able to log in" do
      visit new_user_session_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Log in"
      expect(page).to have_text("Signed in successfully.")
    end

   scenario "The user should be able to log out" do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    visit root_path
    click_link "Logout"
    expect(page).to have_content("Signed out successfully.")
   end

  end

  context "Delete account" do
    let(:user) {FactoryBot.create(:user)}
    before(:each) do
      visit new_user_session_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Log in"
    end
    
    
    scenario "The user should be able to delete their account" do
      
      visit root_path
      click_link "Edit profile"
      click_button "Cancel my account"
      expect(page).to have_content ("Bye! Your account has been successfully cancelled. We hope to see you again soon.")
    end
  end

