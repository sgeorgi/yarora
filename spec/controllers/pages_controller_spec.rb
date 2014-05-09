require 'spec_helper'

describe PagesController do
  context 'when logged in' do
    before(:each) { login_user create(:user) }

    describe 'GET #settings /settings' do
      let(:request) { get :settings }

      it 'returns with status 200' do
        request
        expect(response).to be_ok
      end

      it 'renders the template :settings' do
        request
        expect(response).to render_template(:settings)
      end
    end
  end

  context 'when not logged in' do
    describe 'GET #settings /settings' do
      it 'redirect to the login path' do
        get :settings
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end