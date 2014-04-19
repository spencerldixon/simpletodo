require 'spec_helper'

describe TasksController do
	context "when logged in with a valid user" do
		before :each do
			@user = FactoryGirl.create(:user)
			sign_in @user
		end

		describe "on GET request to the Index action" do
			it "returns an array of all tasks assosciated to the current user assigned to @tasks regardless of list" do
				list_one = FactoryGirl.create(:list, user: @user)
				list_two = FactoryGirl.create(:list, user: @user)

				task_one = FactoryGirl.create(:task, list: list_one)
				task_two = FactoryGirl.create(:task, list: list_two)

				get :index
				expect(assigns(:tasks)).to match_array([task_one, task_two])
			end

			it "renders that index template" do
				get :index
				expect(response).to render_template :index
			end
		end

		describe "on GET request to the New action" do
			it "assigns a new task to @task" do
				get :new
				expect(assigns(:task)).to be_a_new(task)
			end

			it "renders the new template" do
				get :new
				expect(response).to render_template :new
			end
		end

		describe "on GET request to the Edit action" do
			it "assigns the correct task to @task" do
				task = FactoryGirl.create(:task)
				get :edit, id: task
				expect(assign(:task)).to eq task
			end

			it "renders the edit template" do
				task = FactoryGirl.create(:task)
				get :edit, id: task
				expect(response).to render_template :edit
			end
		end

		describe "on POST request to the Create action" do
			context "with valid information" do
				it "adds a new task to the database" do
					expect{
						post :create, task: FactoryGirl.attributes_for(:task)
						}.to change(Task, :count).by(1)
				end

				it "redirects to the show template of the tasks list" do
					post :create, task: FactoryGirl.attributes_for(:task)
					expects(response).to redirect_to list_path(assigns(:list))
				end
			end

			context "with invalid information" do
				it "does not add a task to the database"
				it "re-renders the new template"
			end
		end

		describe "on PATCH request to the Update action" do
			context "with valid information" do
				it "locates the requested @task"
				it "changes the tasks attributes"
				it "redirects to the show template of the tasks list"
			end

			context "with invalid information" do
				it "does not change the tasks attributes"
				it "redirects to the edit template"
			end
		end

		describe "on DELETE request to the Destroy action" do
			it "removes the task from the database"
			it "redirects to the show template of the list"
		end
	end

	context "when not logged in" do
	end

end
