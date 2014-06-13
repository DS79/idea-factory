class IdeasController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

  def index
    @ideas = Idea.all
    @idea = Idea.new
  end

  
  def show
    @comment = Comment.new
    @join =@idea.joins.where(user: current_user).first
    @like =@idea.likes.where(user: current_user).first
    @idea.user = current_user
  end

  def new
    @idea = Idea.new
  end

  def edit
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.user = current_user

    if @idea.save
      redirect_to @idea, notice: 'Idea was successfully created.' 
    else
      flash.now[:alert] = "Problem saving idea"
      render :new 
    end
  end
  def update
    if @idea.update(idea_params)
      redirect_to @idea, notice: 'Idea was successfully updated.' 
    else
      render :edit 
    end
  end

  def destroy
    @idea.destroy
    redirect_to ideas_url, notice: 'Idea was successfully destroyed.' 
  end

  private
    def set_idea
      @idea = Idea.find(params[:id])
    end

    def idea_params
      params.require(:idea).permit(:title, :description)
    end
end
