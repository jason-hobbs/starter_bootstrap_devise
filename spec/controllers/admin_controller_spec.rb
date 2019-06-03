# frozen_string_literal: true

require 'rails_helper'
require 'database_cleaner'

DatabaseCleaner.allow_remote_database_url = true
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

RSpec.describe AdminController, type: :controller do
  context 'when an admin' do
    before do
      @request.env['devise.mapping'] = Devise.mappings[:admin]
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in FactoryBot.create(:admin)
    end
    it 'shows the admin index view' do
      get :index
      expect(response).to render_template(:index)
    end
    it 'edits a user' do
      user = FactoryBot.create(:user)
      get :edit, params: { id: user.id }, xhr: true
      expect(response).to render_template(:edit)
    end
    it 'updates a user' do
      user = FactoryBot.create(:user)
      patch :update, format: user, params: { id: user.id, user: { username: 'test23ring' } }, xhr: true
      expect(response).to redirect_to(admin_index_path)
    end
    it 'does not update a user when the email is empty' do
      user = FactoryBot.create(:user)
      patch :update, format: user, params: { id: user.id, user: { email: '' } }, xhr: true
      expect(response).to render_template(:edit)
    end
    it 'can delete a user' do
      user = FactoryBot.create(:user)
      delete :destroy, params: { id: user.id }
      expect(response).to redirect_to(admin_index_path)
    end
    it 'can confirm a user' do
      user = FactoryBot.create(:user)
      get :confirm, params: { id: user.id }
      expect(response).to redirect_to(admin_index_path)
    end
    it 'can unlock a user' do
      user = FactoryBot.create(:locked)
      get :unlock, params: { id: user.id }
      expect(response).to redirect_to(admin_index_path)
    end
  end

  context 'when not an admin' do
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in FactoryBot.create(:user)
    end
    it 'redirects to the home page when trying to load the admin dashboard' do
      get :index
      expect(response).to redirect_to(root_path)
    end
  end
end
