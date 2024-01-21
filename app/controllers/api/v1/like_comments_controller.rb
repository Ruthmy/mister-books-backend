class Api::V1::LikeCommentsController < ApplicationController
  def create
    @comment = Comment.find(params[:comment_id])
    @like = LikeComment.new(comment_id: @comment.id, user_id: current_user.id)

    if @like.save
      render json: { success: true, message: 'You have liked the comment!.' }
    else
      render json: { success: false, message: "Something is wrong! You couldn't like the post!." }
    end
  end

  def destroy
    @like = LikeComment.find(params[:id])

    if @like.destroy
      render json: { success: true, message: 'You have unliked the comment!.' }
    else
      render json: { success: false, message: "Something is wrong! You couldn't unlike the post!." }
    end
  end
end
