class ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lists = current_user.lists
  end

  def new
    @list = current_user.lists.build
  end

  def create
    @list = current_user.lists.build(list_params)

    if @list.save
      flash[:success] = "List created successfully!"
      redirect_to lists_path
    else
      flash[:danger] = "There was an error saving the list, please try again"
      redirect_to lists_path
    end
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  # Custom Methods

  def share
  end

  private
    def list_params
      params.require(:list).permit(:name)
    end
end
