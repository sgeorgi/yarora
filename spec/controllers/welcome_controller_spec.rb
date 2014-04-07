require 'spec_helper'

describe WelcomeController do

  describe 'GET  #index' do
    let(:response) { get :index }

    it 'responds with status 200' do
      expect(response).to be_success
      expect(response.status).to be(200)
    end

    it 'renders template :index' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #features' do
    let(:response) { get :features }

    it 'responds with status 200' do
      expect(response).to be_success
      expect(response.status).to be(200)
    end

    it 'renders template :index' do
      expect(response).to render_template(:features)
    end
  end
end