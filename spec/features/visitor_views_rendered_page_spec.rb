require 'spec_helper'

feature 'visitor views rendered page', %Q{
  As a visitor
  I want to view a list
  So that I can see the associated reasons
} do

  # Acceptance Criteria
  #
  # rendered pages are viewable by anyone
  # rendered pages can not be edited
  # clicking button will randomly show a new reason
  # only one reason is displayed at a time

  let (:list) { FactoryGirl.create(:list) }

  scenario 'visitor views a rendered page' do
    5.times { FactoryGirl.create(:reason, list_id: list.id) }

    visit list_path(list)
    expect(page).to have_content('Reasons')
  end

  scenario 'visitor clicks new reason button', js: true do
    5.times { FactoryGirl.create(:reason, list_id: list.id) }

    visit list_path(list)
    click_button 'Give Me Another Reason!'

    expect(page).to have_content('You can convey so much information in a list-based format.')
  end

end
