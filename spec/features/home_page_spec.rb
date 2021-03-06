require 'rails_helper'

RSpec.feature "HomePages", type: :feature do
  scenario "The visitor should see projects" do
    visit projects_path # Follows route to root_path
    expect(page).to have_text("Projects") # Should show all projects that have been created
  end
end
