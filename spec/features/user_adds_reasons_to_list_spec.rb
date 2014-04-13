require 'spec_helper'

feature 'user adds reason to list', %Q{
  As an authenticated user
  I want to add reasons to the list I created
  So that they can be shared with others
} do

  # Acceptance Criteria
  #
  # user can only access their own list pages
  # user can add multiple reasons to a list
  # reason must have description field filled

  let (:list) { FactoryGirl.create(:list) }

  scenario 'required information is supplied' do
    user = list.user
    sign_in_as(user)

    list = user.lists.first
    within "#list_#{list.id}" do
      click_link 'Edit'
    end
    reason = FactoryGirl.build(:reason)
    fill_in 'body', with: reason.body
    click_button 'Create Reason'

    expect(page).to have_content('Reason was successfully added.')

  end

  scenario 'unauthenticated user attempts to visit page' do
    visit edit_list_path(list)

    expect(page).to have_content('You need to sign in or sign up before continuing.')
    expect(page).to_not have_content(list.title)
  end

end
