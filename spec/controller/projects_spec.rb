require "rails_helper"

RSpec.describe ProjectsController, type: :controller do

  login_user

  context "GET #index" do
    it "returns successful response" do
      get :index
      # expect(response.success).to eq(true)
       expect(response).to be_success
      # expect(response).to have_http_status(302)
    end
  end

  context "GET #show" do
    let!(:project) { Project.create(title: "Test title", description: "Test description") }
    it "returns successful response" do
      get :show, params: { id: project }
      expect(response).to be_success
      # expect(response).to have_http_status(302)
    end
  end
end