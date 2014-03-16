require 'spec_helper'
describe "Users", :js => true do
  let!(:user) { User.create(username: 'test',
                            email: 'test@test.com',
                            password: 'testing',
                            password_confirmation: 'testing')}
  context "homepage" do
    it "displays login form" do
      visit root_path
      expect(page).to have_link 'log in'
    end

    it "displays login form" do
      visit root_path
      expect(page).to have_link 'sign up'
    end
  end

end