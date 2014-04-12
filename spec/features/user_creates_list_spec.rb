require 'spec_helper'

feature 'user creates list', %Q{
  As an authenticated user
  I want to create a list
  So that I can share my list of reasons
} do

  # Acceptance Criteria
  #
  # user must be signed in to create list
  # list name must be specified
  # list name must be unique to user
  # creating a list goes to add reasons page
  # list subjects and adjective must be specified
  # empty fields trigger error message

  let (:user) { FactoryGirl.create(:user) }

  scenario 'required information is supplied' do
    sign_in_as(user)
    click_link 'New List'

    list = FactoryGirl.build(:list)
    fill_in 'title', with: list.title
    fill_in 'subject_a', with: list.subject_a
    fill_in 'adjective', with: list.adjective
    fill_in 'subject_b', with: list.subject_b
    click_button 'Create List'

    expect(page).to have_content('List was successfully created.')
  end

end
