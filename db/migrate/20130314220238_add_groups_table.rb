class AddGroupsTable < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :assignment_id
      t.timestamps
    end
  end
end
