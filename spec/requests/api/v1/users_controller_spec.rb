require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  let(:user) { User.create(name: 'Ruth Abreu', username: 'Linda', password: '123456', email: 'ruth@test.com') }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: user.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the requested user' do
        put :update, params: { id: user.id, user: { name: 'New Name' } }
        user.reload
        expect(user.name).to eq('New Name')
      end

      it 'returns a success response' do
        put :update, params: { id: user.id, user: { name: 'New Name' } }
        expect(response).to have_http_status(:success)
      end
    end

    context 'with invalid params' do
      it 'returns an unprocessable entity response' do
        put :update, params: { id: user.id, user: { name: '' } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
