require 'rails_helper'

RSpec.describe Api::V1::LikeCommentsController, type: :controller do
  let(:user) { User.create(name: 'Ruth Abreu', username: 'Linda', password: '123456', email: 'ruth@test.com') }
  let(:comment) { Comment.create(user_id: user.id, comment: 'This is a comment', book_id: 123) }

  before do
    sign_in(user)
  end

  describe 'POST #create' do
    it 'creates a like for the comment' do
      post :create, params: { comment_id: comment.id }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to include('success' => true, 'message' => 'You have liked the comment!.')
    end
  end

  describe 'Delete #destroy' do
    it 'destroys the like for the comment' do
      like = LikeComment.create(user:, comment:)
      delete :destroy, params: { id: like.id }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to include('success' => true, 'message' => 'You have unliked the comment!.')
    end
  end
end
