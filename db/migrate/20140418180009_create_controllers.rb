class CreateControllers < ActiveRecord::Migration
  def change
    create_table :controllers do |t|
      t.string :Tasks

      t.timestamps
    end
  end
end
