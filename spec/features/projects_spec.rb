require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }
end

RSpec.feature "Projects", type: :feature do

  context "Redirect if not signed in" do
    scenario ("Should be successful") do
      visit root_path
      click_link "Logout"
      click_link "New project"
      expect(page).to have_content("Forgot your password?")
    end
  end

  let(:user) {FactoryBot.create(:user)}

  before(:each) do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
  end

  context "Create new project" do
    before(:each) do
      visit new_project_path
      within("form") do
        fill_in "Title", with: "Test title"
      end
    end

    scenario "should be successful" do
      fill_in "Description", with: "Test description"
      click_button "Create Project"
      expect(page).to have_content("Project was successfully created")
    end

    scenario "should fail" do
      click_button "Create Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Return to main menu" do
    let(:project) { Project.create(title: "Test title", description: "Test content") }
    before(:each) do
      visit project_path(project)
    end
    scenario "should be successful" do
      click_link "Back to projects"
      expect(page).to have_content("Projects")
    end
  end

  context "Update project" do
    let(:project) { Project.create(title: "Test title", description: "Test content") }
    before(:each) do
      visit edit_project_path(project)
    end

    scenario "should be successful" do
      within("form") do
        fill_in "Description", with: "New description content"
      end
      click_button "Update Project"
      expect(page).to have_content("Project was successfully updated")
    end

    scenario "should fail" do
      within("form") do
        fill_in "Description", with: ""
      end
      click_button "Update Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Remove existing project" do
    let!(:project) { Project.create(title: "Test title", description: "Test content") }
    scenario "remove project" do
      visit projects_path
      click_link "Show this project"
      click_button "Destroy this project"
      expect(page).to have_content("Project was successfully destroyed.")
      expect(Project.count).to eq(0)
    end
  end


end