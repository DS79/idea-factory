class JoinsController < ApplicationController

  before_action :authenticate_user!, :find_idea

  def create
    @join      = @idea.joins.new
    @join.user = current_user
    
    if current_user.id == @idea.user_id
      redirect_to @idea, alert: "you can't join your own idea"
    elsif @join.save
      redirect_to @idea, notice: "i love this idea"
    else
      redirect_to @idea, alert: "couldn't join"
    end
  end

  def destroy
    @join      = current_user.joins.find params[:id]
    if @join.destroy
      redirect_to @idea, notice: "Disjoined"
    else
      redirect_to @idea, alert: "couldn't Disjoin"
    end
  end

  def find_idea
    @idea      = Idea.find(params[:idea_id])

  end


end
