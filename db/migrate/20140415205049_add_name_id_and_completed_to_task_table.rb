class AddNameIdAndCompletedToTaskTable < ActiveRecord::Migration
  def change
  	add_column :tasks, :name, :string
  	add_column :tasks, :completed, :boolean, default: :false
  	add_column :tasks, :list_id, :integer
  end
end
