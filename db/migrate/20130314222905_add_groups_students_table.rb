class AddGroupsStudentsTable < ActiveRecord::Migration
  def change
    create_table :groups_students, :id => false do |t|
      t.integer :student_id
      t.integer :group_id
    end
  end
end
