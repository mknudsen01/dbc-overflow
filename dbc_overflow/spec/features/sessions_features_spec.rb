require 'spec_helper'

describe "Sessions", :js => true do
  let!(:user) { create :user }

  context "signup" do
    it "displays signin form" do
      visit root_path
      click_on 'sign up'
      expect(page).to have_button 'Signup'
    end
    it "brings you to question page after sign up" do
      visit new_user_path
      fill_in "Username", :with => "business"
      fill_in "Email", :with => "business@now.com"
      fill_in "Password", :with => "business"
      fill_in "Password Confirmation", :with => "business"
      click_on 'Signup'
      expect(page).to have_link 'Ask a Question'
    end
  end

  context "login" do
    it 'brings you to login page' do
      visit root_path
      click_on 'log in'
      expect(page).to have_button 'Login'
    end
    it 'brings you to question page after login' do
      visit users_path
      fill_in "Email", :with => user.email
      fill_in "Password", :with => user.password
      click_on 'Login'
      expect(page).to have_link 'Ask a Question'
    end
  end

  context 'home button' do
    it 'brings you to home page' do
       visit users_path
       my_link = find(:xpath, "//a[contains(@href,'/questions')]")
       my_link.click
       expect(page).to have_link 'Ask a Question'
    end
  end

  context 'logout' do
    it 'brings you back to login page' do
      visit users_path
      fill_in "Email", :with => user.email
      fill_in "Password", :with => user.password
      click_on 'Login'
      click_on 'log out'
      expect(page).to have_button 'Login'
    end
  end

end

