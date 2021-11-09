require "rails_helper"

RSpec.describe Project, type: :model do
  context "validations tests" do
    it "ensures the description is present" do
      project = Project.new(description: "Content of the description") # Fills in a project with no title, but a description
      expect(project.valid?).to eq(false)
    end

    
    it "should be able to save project" do
      project = Project.new(title: "Title", description: "Some description content goes here") # Should save the project
      expect(project.save).to eq(true)
    end
  end

  context "scopes tests" do

  end
end

RSpec.describe Project, type: :model do
    # ...
  
    context "scopes tests" do
      let(:params) { { title: "Title", description: "some description" } }
      before(:each) do
        Project.create(params) # These 3 Lines create 3 test projects with a dummy Title and Description
        Project.create(params)
        Project.create(params)
      end
  
      it "should return all projects" do
        expect(Project.count).to eq(3) # Should have counted 3 projects
      end
  
    end
  end