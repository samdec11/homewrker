class AddAssignmentsTable < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :name
      t.integer :groupsize
      t.timestamps
    end
  end
end
