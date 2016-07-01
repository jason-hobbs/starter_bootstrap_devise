require 'rails_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

RSpec.describe AdminController, type: :controller do
  context "when an admin" do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in FactoryGirl.create(:admin)
    end
    it "shows the admin index view" do
      get :index
      expect(response).to render_template(:index)
    end
    it "edits a user" do
      user = FactoryGirl.create(:user)
      get :edit, format: user
      expect(response).to render_template(:edit)
    end
    it "updates a user" do
      user = FactoryGirl.create(:user)
      patch :update, format: user, params: { user: { :username => "test23r" } }
      expect(response).to redirect_to(admin_path)
    end
    it "doesn't update a user when the email is empty" do
      user = FactoryGirl.create(:user)
      patch :update, format: user, params: {user: {:email => ""}}
      expect(response).to render_template(:edit)
    end
    it "can delete a user" do
      user = FactoryGirl.create(:user)
      delete :destroy, format: user
      expect(response).to redirect_to(admin_path)
    end
    it "can confirm a user" do
      user = FactoryGirl.create(:user)
      get :confirm, params: {id: user.id}
      expect(response).to redirect_to(admin_path)
    end
    it "can unlock a user" do
      user = FactoryGirl.create(:locked)
      get :unlock, params: {id: user.id}
      expect(response).to redirect_to(admin_path)
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
