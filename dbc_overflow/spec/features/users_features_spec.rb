require 'spec_helper'
describe "Users", :js => true do
  # As you can see here we're using let! as opposed to let. By default, let, lazy loads the variable. Meaning, it won't actually do the work until you need the variable. However, let! eager loads it, meaning, do the work right away. The reason we want to eager load here is because we need category to be available right away when we visit the root_path, otherwise, the test will fail as no categories actually exist.
  let!(:category) { FactoryGirl.create :category }
  # we can override anything in our factories by passing a key value pair.
  let!(:post) { FactoryGirl.create :post, :category => category }
  context "homepage" do
    it "lists all the Categories" do
      # capybara allows us to visit a page (we use js => true on top to open the browser) and inspect the elements on it. It returns a page object that we can call a bunch of stuff on. Try puts page.inspect after line 8
      visit root_path
      expect(page).to have_content category.name
    end
  end

  context "category page" do
    it "shows the name and the list of posts associated with it" do
      visit root_path
      click_on category.name
      expect(page).to have_content category.name
      expect(page).to have_content post.title
    end
  end

  context "create a category" do
    it "redirects to the category page if successful" do
      visit new_category_path
      fill_in "Name", :with => "business"
      click_on "Create Category"
      expect(page).to have_content "business"
    end

    it "renders the form with errors if unsuccessful" do
      visit new_category_path
      click_on "Create Category"
      expect(page).to have_content "Name can't be blank"
    end
  end

  context "update a category" do
    it "redirects to the category page if successful" do
      visit edit_category_path(category)
      fill_in "Name", :with => "business"
      click_on "Update Category"
      expect(page).to have_content "business"
    end

    it "renders the form with errors if unsuccessful" do
      visit edit_category_path(category)
      fill_in "Name", :with => ""
      click_on "Update Category"
      expect(page).to have_content "Name can't be blank"
    end
  end
end