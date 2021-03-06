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
    fill_in 'reason_body', with: reason.body
    click_button 'Create Reason'

    expect(page).to have_content('Reason was successfully added.')
    expect(page).to have_content('Add some more!')
  end

  scenario 'unauthenticated user attempts to visit page' do
    visit edit_list_path(list)

    expect(page).to have_content('You need to sign in or sign up before continuing.')
    expect(page).to_not have_content(list.title)
  end

  scenario 'plurality is correct when one reason' do
    user = list.user
    sign_in_as(user)

    list = user.lists.first
    within "#list_#{list.id}" do
      click_link 'Edit'
    end
    reason = FactoryGirl.build(:reason)
    fill_in 'reason_body', with: reason.body
    click_button 'Create Reason'

    expect(page).to have_content('You only have 1 reason?')

    fill_in 'reason_body', with: reason.body
    click_button 'Create Reason'

    expect(page).to have_content('You only have 2 reasons?')
  end

  scenario 'link to view is only shown when 5 reasons created' do
    user = list.user
    sign_in_as(user)

    list = user.lists.first
    within "#list_#{list.id}" do
      click_link 'Edit'
    end

    expect(page).to have_content('You only have 0 reasons? Add some more!')
    expect(page).to_not have_content('Share with the world!')

    4.times do |x|
      fill_in 'reason_body', with: 'Reason ' + (x + 1).to_s
      click_button 'Create Reason'
    end
    expect(page).to_not have_content('Share with the world!')

    fill_in 'reason_body', with: 'Reason 5'
    click_button 'Create Reason'

    expect(page).to have_content('Share with the world!')
  end

end
