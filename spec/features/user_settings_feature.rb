require 'spec_helper'

feature 'Showing the user settings', with_devise_user: true do
  scenario 'by clicking on the header link' do
    # Test setup
    user_logs_in

    # User interaction
    visit '/'
    click_link I18n.t('header.user.user_profile')

    # Result
    expect(page).to have_content(I18n.t('pages.user_profile.title'))
  end
end