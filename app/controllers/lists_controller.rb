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
      redirect_to @list
    else
      flash[:danger] = "There was an error saving the list, please try again"
      render 'new'
    end
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])

    if @list.update_attributes(list_params)
      flash[:success] = "List renamed successfully"
      redirect_to @list
    else
      render 'edit'
    end
  end

  def destroy
    @list = List.find(params[:id])

    if @list.present?
      @list.destroy
      flash[:success] = "List deleted successfully!"
    end

    redirect_to lists_path
  end

  # Custom Methods

  def share
  end

  private
    def list_params
      params.require(:list).permit(:name)
    end
end
