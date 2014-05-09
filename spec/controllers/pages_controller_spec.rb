require 'spec_helper'

describe PagesController do
  context 'when logged in' do
    before(:each) { login_user create(:user) }

    describe 'GET #user_profile /user_profile' do
      let(:request) { get :user_profile }

      it 'returns with status 200' do
        request
        expect(response).to be_success
      end

      it 'renders the template :user_profile' do
        request
        expect(response).to render_template(:user_profile)
      end
    end
  end

  context 'when not logged in' do
    describe 'GET #user_profile /user_profile' do
      it 'redirect to the login path' do
        get :user_profile
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end