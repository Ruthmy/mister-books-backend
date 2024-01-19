require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe 'POST #create' do
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
    end

    context 'with valid parameters' do
      it 'creates a new user' do
        post :create, params: { user: {
          name: 'Ruth',
          username: 'linda :)',
          email: 'john@example.com',
          password: 'password'
        } }
        expect(response).to have_http_status(:created)
        expect(response).to be_successful
        expect(User.last.name).to eq('Ruth')
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new user' do
        post :create, params: { user: {
          name: 'Ruth',
          username: 'linda :)',
          email: 'invalid email',
          password: 'password'
        } }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(User.last).to be_nil
      end
    end
  end
end
