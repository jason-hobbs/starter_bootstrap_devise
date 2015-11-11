require 'rails_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

RSpec.describe AdminController, type: :controller do
  context "when an admin" do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in FactoryGirl.create(:admin)
    end
    it "shows the admin index view" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  context "when not an admin" do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in FactoryGirl.create(:user)
    end
    it "redirects to the home page when trying to load the admin dashboard" do
      get :index
      expect(response).to redirect_to(root_path)
    end
  end
end
