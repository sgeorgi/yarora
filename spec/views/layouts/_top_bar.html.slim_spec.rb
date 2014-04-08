require 'spec_helper'

describe 'layouts/_top_bar.html.slim' do
  # Get rid of the faulty locale switcher, because it's not controller/action-agnostic
  before(:each) { allow(view).to receive(:locale_switch).and_return('') }

  it 'renders without fail' do
    expect { render }.not_to raise_error
  end

  pending 'write me' do
    it 'shows a link to login' do
    end

    it 'does not show the login link when logged in' do
    end

    it 'shows a link to logout when logged in' do
    end

    it 'does not show a link to logout when not logged in' do
    end
  end
end