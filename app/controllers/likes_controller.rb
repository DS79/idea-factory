class LikesController < ApplicationController


  before_action :authenticate_user!, :find_idea

  def create
    @like      = @idea.likes.new
    @like.user = current_user

    if current_user.id == @idea.user_id
      redirect_to @idea, alert: "you can't like your own idea"
    elsif @like.save
      redirect_to @idea, notice: "Thanks for liking this idea"
    else
      redirect_to @idea, alert: "you already liked this idea"
    end
  end

  def destroy
    @like      = current_user.likes.find params[:id]
    if @like.destroy
      redirect_to @idea, notice: "Disliked"
    else
      redirect_to @idea, alert: "couldn't Dislike"
    end
  end

  def find_idea
    @idea      = Idea.find(params[:idea_id])

  end

end
