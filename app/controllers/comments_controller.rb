class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @idea    = Idea.find(params[:idea_id])
    @comment      = @idea.comments.new(comment_params)
    @idea.user = current_user
    if @comment.save
      redirect_to @idea, notice: "Comment created successfully"
    else
      render "/ideas/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
