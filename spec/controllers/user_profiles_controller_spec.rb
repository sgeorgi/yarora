require 'spec_helper'

describe UserProfilesController do
  context 'when logged in' do
    before(:each) do
      user = create :user
      user.confirm!
      sign_in user
    end

    describe 'GET #show /user_profile' do
      let(:response) { get :show }

      it 'responds with status 200' do
        expect(response).to be_ok
      end

      it 'renders template :show' do
        expect(response).to render_template(:show)
      end
    end
  end
end