class TasksController < ApplicationController
	def index
		@tasks = current_user.tasks
	end
	
	def new
		@task = current_user.tasks.build
	end

	def create
		@task = current_user.tasks.build(task_params)

		if @task.save
			flash[:success] = "Task created successfully!"
			redirect_to @task
		else
			flash[:danger] = "There was an error, please try again"
			render 'new'
		end
	end

	def edit
		@task = Task.find(params[:id])
	end

	def update
		@task = Task.find(params[:id])

		if @task.update_attributes(task_params)
			flash[:success] = "Task updated successfully!"
			redirect_to @task
		else
			flash[:danger] = "There was an error, please try again"
			render 'edit'
		end 
	end

	def destroy
		@task = Task.find(params[:id])

		if @task.present?
			@task.destroy
			flash[:success] = "Task deleted successfully!"
		end

		redirect_to root_path
	end
end

private
		def task_params
			params.require(:task).permit(:name, :completed, :list_id)
		end