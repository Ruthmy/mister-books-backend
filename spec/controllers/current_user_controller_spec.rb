require 'rails_helper'

RSpec.describe CurrentUserController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe 'GET #index' do
    context 'when user is authenticated' do
      let(:user) do
        User.create(
          name: 'Ruth',
          username: 'Bella :)',
          email: 'email@email.com',
          password: '123456'
        )
      end

      before do
        @request.env['devise.mapping'] = Devise.mappings[:user]
        sign_in user
        get :index
      end

      it 'returns a successful response' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns the current user attributes in the response' do
        expected_attributes = {
          'created_at' => user.created_at.utc.iso8601,
          'created_date' => user.created_at.strftime('%m/%d/%Y'),
          'email' => user.email,
          'id' => user.id,
          'name' => user.name,
          'username' => user.username
        }

        response_attributes = JSON.parse(response.body)
        response_created_at = Time.parse(response_attributes['created_at']).utc.iso8601

        expect(response_created_at).to eq(expected_attributes['created_at'])
        expect(response_attributes.except('created_at')).to eq(expected_attributes.except('created_at'))
      end
    end

    context 'when user is not authenticated' do
      it 'returns unauthorized status' do
        get :index
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
