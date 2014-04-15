class ListsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @lists = current_user.lists
  end

  def new
  end

  def create
  end

  def show
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
end
