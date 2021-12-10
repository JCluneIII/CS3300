require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  context "Create new project" do
    before(:each) do
      user = FactoryBot.create(:user)
      login_as(user)
      visit new_project_path # Checks if the route for a new project is correct (GET /projects/new)
      within("form") do
        fill_in "Title", with: "Test title" # Fills title parameter with a test title
      end
    end

    scenario "should be successful" do
      fill_in "Description", with: "Test description" # Fills description parameter with a test description
      click_button "Create Project" # Uses the create project button and it's route (POST /projects or /projects.json)
      expect(page).to have_content("Project was successfully created") 
    end

    scenario "should fail" do
      click_button "Create Project" # Does not fill description, which is required
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Update project" do
    let(:project) { Project.create(title: "Test title", description: "Test content") } # Creates a new project with a test title and description
    before(:each) do
      user = FactoryBot.create(:user)
      login_as(user)
      visit edit_project_path(project) # Visits the route for the edit project (GET /projects/1/edit)
    end

    scenario "should be successful" do
      within("form") do
        fill_in "Description", with: "New description content" # Edits the description to something new
      end
      click_button "Update Project" # Uses the update project button and it's route (PATCH/PUT /projects/1)
      expect(page).to have_content("Project was successfully updated")
    end

    scenario "should fail" do
      within("form") do
        fill_in "Description", with: "" # Replaces filled description with a blank one
      end
      click_button "Update Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Remove existing project" do
    let!(:project) { Project.create(title: "Test title", description: "Test content") } # Creates a new project with a test title and description
    scenario "remove project" do
      user = FactoryBot.create(:user)
      login_as(user)
      visit projects_path # Visits route (GET /projects/1)
      click_link "Destroy" # Visits route (DELETE /projects/1)
      expect(page).to have_content("Project was successfully destroyed")
      expect(Project.count).to eq(0)
    end
  end
end
