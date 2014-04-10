require 'spec_helper'

# email = 'test@test.com'
# password = 'ABC123xyz!!'

feature 'Devise', devise_feature: true do
  scenario 'User login and logout' do
    visit '/'
    click_on I18n.t('header.user.login')

    fill_in :user_email, with: 'test@test.com'
    fill_in :user_password, with: 'ABC123xyz!!'

    click_on 'login_button'
    expect(page).to have_content(I18n.t('devise.sessions.signed_in'))

    click_link I18n.t('header.user.logout')
    expect(page).to have_content(I18n.t('devise.sessions.signed_out'))
  end
end