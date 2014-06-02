require 'spec_helper'

feature 'user registers for site', %Q{
  As an unregistered user
  I want to register for the site
  So that I may create lists
} do

  # Acceptance Criteria
  #
  # registration requires email address, password
  # email address must be unique
  # error message displayed if fields left blank
  # error message displayed if passwords do not match
  # with required information specified, access granted to welcome page

  scenario 'specifying valid and required information' do
    user = FactoryGirl.build(:user)
    visit root_path
    click_link 'Sign Up'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password_confirmation
    click_button 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Sign Out')
    expect(page).to_not have_content('Sign In')
    expect(page).to_not have_content('Sign Up')
  end

  scenario 'authenticated user can only edit their own lists' do
    other_list = FactoryGirl.create(:list)
    list = FactoryGirl.create(:list)
    user = list.user

    sign_in_as(user)
    visit edit_list_path(list)

    expect(page).to have_selector(:link_or_button, 'Create Reason')
    expect(page).to have_content('Add some more!')

    visit edit_list_path(other_list)
    expect(page).to_not have_selector(:link_or_button, 'Create Reason')
    expect(page).to_not have_content('Add some more!')
    expect(page).to have_selector(:link_or_button, 'Create List')
    expect(page).to have_content('Hey! Make your own list, pal!')
  end

end
