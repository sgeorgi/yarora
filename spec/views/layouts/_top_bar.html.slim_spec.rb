require 'spec_helper'

describe 'layouts/_top_bar.html.slim' do
  # Get rid of the faulty locale switcher, because it's not controller/action-agnostic
  before(:each) { allow(view).to receive(:locale_switch).and_return('') }

  it 'renders without fail' do
    expect { render }.not_to raise_error
  end

  it 'shows a link to login' do
    render
    expect(rendered).to include(I18n.t('header.user.login'))
  end

  it 'does not show the login link when logged in' do
    allow(view).to receive(:user_signed_in?).and_return(true)
    render
    expect(rendered).not_to include(I18n.t('header.user.login'))
  end

  it 'shows a link to logout when logged in' do
    allow(view).to receive(:user_signed_in?).and_return(true)
    render
    expect(rendered).to include(I18n.t('header.user.logout'))
  end

  it 'does not show a link to logout when not logged in' do
    allow(view).to receive(:user_signed_in?).and_return(false)
    render
    expect(rendered).not_to include(I18n.t('header.user.logout'))
  end

  it 'does not show a link to profile when not logged in' do
    allow(view).to receive(:user_signed_in?).and_return(false)
    render
    expect(rendered).not_to include(I18n.t('header.user.profile'))
  end

  it 'does show a link to profile when logged in ' do
    allow(view).to receive(:user_signed_in?).and_return(true)
    render
    expect(rendered).to include(I18n.t('header.user.profile'))
  end

  it 'does show a link to signup when not logged in' do
    allow(view).to receive(:user_signed_in?).and_return(false)
    render
    expect(rendered).to include(I18n.t('header.user.signup'))
  end

  it 'does not show a link to signup when logged in ' do
    allow(view).to receive(:user_signed_in?).and_return(true)
    render
    expect(rendered).not_to include(I18n.t('header.user.signup'))
  end

end