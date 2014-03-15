require 'spec_helper'
describe "Users", :js => true do
  let!(:user) { User.create(username: 'test',
                            email: 'test@test.com',
                            password: 'testing',
                            password_confirmation: 'testing')}
  context "homepage" do
    it "displays login form" do
      visit root_path
      expect(page).to have_button 'Login'
    end

    it "displays login form" do
      visit root_path
      expect(page).to have_link 'Sign Up'
    end
  end

  # context "category page" do
  #   it "shows the name and the list of posts associated with it" do
  #     visit root_path
  #     click_on category.name
  #     expect(page).to have_content category.name
  #     expect(page).to have_content post.title
  #   end
  # end

  # context "create a category" do
  #   it "redirects to the category page if successful" do
  #     visit new_category_path
  #     fill_in "Name", :with => "business"
  #     click_on "Create Category"
  #     expect(page).to have_content "business"
  #   end

  #   it "renders the form with errors if unsuccessful" do
  #     visit new_category_path
  #     click_on "Create Category"
  #     expect(page).to have_content "Name can't be blank"
  #   end
  # end

  # context "update a category" do
  #   it "redirects to the category page if successful" do
  #     visit edit_category_path(category)
  #     fill_in "Name", :with => "business"
  #     click_on "Update Category"
  #     expect(page).to have_content "business"
  #   end

  #   it "renders the form with errors if unsuccessful" do
  #     visit edit_category_path(category)
  #     fill_in "Name", :with => ""
  #     click_on "Update Category"
  #     expect(page).to have_content "Name can't be blank"
  #   end
  # end
end