require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do
  include Devise::Test::ControllerHelpers

  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe 'POST #create' do
    let(:user) do
      User.create(
        name: 'Ruth',
        username: 'Bella :)',
        email: 'email@email.com',
        password: '123456'
      )
    end

    it 'logs in successfully' do
      sign_in user
      post :create, params: { user: { email: user.email, password: user.password } }
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['status']['message']).to eq('Logged in successfully.')
    end
  end

  describe 'DELETE #destroy' do
    let(:user) do
      User.create(
        name: 'Ruth',
        username: 'Bella :)',
        email: 'email@email.com',
        password: '123456'
      )
    end

    it 'logs out successfully' do
      sign_in user
      delete :destroy
      expect(response).to have_http_status(:unauthorized)
      expect(JSON.parse(response.body)['status']).to eq(401)
      expect(JSON.parse(response.body)['message']).to eq("Couldn't find an active session.")
    end

    it 'fails to log out if not logged in' do
      delete :destroy
      expect(response).to have_http_status(:unauthorized)
      expect(JSON.parse(response.body)['status']).to eq(401)
      expect(JSON.parse(response.body)['message']).to eq("Couldn't find an active session.")
    end
  end
end
