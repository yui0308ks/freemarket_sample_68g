class CommentsController < ApplicationController
  def create
    # binding.pry
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html { redirect_to item_path(params[:item_id])  }
      format.json
    end
    # redirect_to "/items/#{comment.item.id}"   エラーが出ており、一旦削除
    # コメントと結びつくツイートの詳細画面に遷移する
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
