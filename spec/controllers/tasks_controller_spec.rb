require 'spec_helper'

describe TasksController do
	context "when logged in with a valid user" do
		describe "on GET request to the Index action" do
			it "returns an array of all tasks assosciated to the current user assigned to @tasks regardless of list"
			it "renders that index template"
		end

		describe "on GET request to the New action" do
			it "assigns a new task to @task"
			it "renders the new template"
		end

		describe "on GET request to the Edit action" do
			it "assigns the correct task to @task"
			it "renders the edit template"
		end

		describe "on POST request to the Create action" do
			context "with valid information" do
				it "adds a new task to the database"
				it "redirects to the show template of the tasks list"
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
