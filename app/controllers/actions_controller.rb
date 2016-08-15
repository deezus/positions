class ActionsController < ApplicationController
  before_action :find_action, only: [:show, :edit, :update, :destroy]

  def index
    @action = Action.all
  end

  def new
    @action = Action.new
  end

  def show
  end

  def create
    @action = Action.new
    @action.name = params[:name]
    @action.save
    if @action.save
      redirect_to actions_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @action.name = params[:name]
    if @action.update(:name => params[:name])
      redirect_to actions_path(@action)
    else
      render 'edit'
    end
  end

  def destroy
    @action.destroy
    redirect_to actions_path
  end

  private

    def find_action
      @action = Action.find(params[:id])
    end
end
