require "rails_helper"
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

user = User.create!(user_attributes)

describe "Signing in" do
  it "prompts for an email and password" do
    visit root_url
    click_link 'Sign In'
    expect(current_path).to eq(new_user_session_path)
    expect(body).to have_field("user_login")
    expect(body).to have_field("user_password")
  end
  it "signs in the user if the email/password combination is valid" do
    visit root_url
    click_link 'Sign In'
    fill_in "user_login", with: user.reload.email
    fill_in "user_password", with: user.password
    click_button 'Sign in'
    expect(body).to have_text("#{user.username}")
  end
  it "signs in the user if the name/password combination is valid" do
    visit root_url
    click_link 'Sign In'
    fill_in "user_login", with: user.username
    fill_in "user_password", with: user.password
    click_button 'Sign in'
    expect(body).to have_text("#{user.username}")
  end
  it "does not sign in the user if the email/password combination is invalid" do
    visit root_url
    click_link 'Sign In'
    fill_in "user_login", with: user.email
    fill_in "user_password", with: "no match"
    click_button 'Sign in'
    expect(body).to have_field("user_login")
    expect(body).to have_field("user_password")
  end
  it "signs a user out" do
    visit root_url
    click_link 'Sign In'
    fill_in "user_login", with: user.username
    fill_in "user_password", with: user.password
    click_button 'Sign in'
    click_link 'William Wallace'
    click_link 'Sign Out'
    expect(body).to have_text("Sign In")
    expect(body).to have_text("Sign Up")
  end
end
