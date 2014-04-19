class TasksController < ApplicationController
	def index
		@tasks = current_user.tasks
	end
	
	def new
		
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end
end
