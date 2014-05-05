require 'spec_helper'

# email = 'test@test.com'
# password = 'ABC123xyz!!'

feature 'Devise', with_devise_user: true do
  scenario 'Existing User logs in and logs out' do
    user_logs_in

    click_link I18n.t('header.user.logout')
    expect(page).to have_content(I18n.t('devise.sessions.signed_out'))
  end

  scenario 'User registers' do
    visit '/'
    click_link I18n.t('header.user.signup')

    fill_in :user_email, with: 'test2@test.com'
    fill_in :user_password, with: 'ABC123xyz!!'
    fill_in :user_password_confirmation, with: 'ABC123xyz!!'

    click_button I18n.t('devise.ui.sign_up')
    expect(page).to have_content(I18n.t('devise.registrations.signed_up_but_unconfirmed'))
  end

  scenario 'User changes password' do
    user_logs_in

    click_link I18n.t('header.user.profile')

    fill_in :user_password, with: 'DBC123xyz!!'
    fill_in :user_password_confirmation, with: 'DBC123xyz!!'
    fill_in :user_current_password, with: 'ABC123xyz!!'
    click_button I18n.t('update')

    expect(page).to have_content(I18n.t('devise.registrations.updated'))
  end

  scenario 'User changes email address and confirms' do
    user_logs_in

    click_link I18n.t('header.user.profile')
    fill_in :user_current_password, with: 'ABC123xyz!!'
    fill_in :user_email, with: 'another@email.com'
    click_button I18n.t('update')

    expect(page).to have_content(I18n.t('devise.registrations.update_needs_confirmation'))
    expect(ActionMailer::Base.deliveries.last.to).to eq(['another@email.com'])

    user_visits_link_in_email(ActionMailer::Base.deliveries.last)
    expect(page).to have_content(I18n.t('devise.confirmations.confirmed'))
  end

  scenario 'User forgets password' do
    pending
    expect(true).to be_false
  end

  scenario 'User requests another confirmation mail' do
    pending
    expect(true).to be_false
  end
end