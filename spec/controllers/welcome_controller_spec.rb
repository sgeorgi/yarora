require 'spec_helper'

describe WelcomeController do

  describe 'GET  #index' do
    before(:each) { get :index }

    it 'responds with status 200' do
      expect(response).to be_success
      expect(response.status). to be(200)
    end

    it 'renders template :index' do
      expect(response).to render_template(:index)
    end
  end
end