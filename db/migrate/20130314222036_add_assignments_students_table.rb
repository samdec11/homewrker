class AddAssignmentsStudentsTable < ActiveRecord::Migration
  def change
    create_table :assignments_students, :id => false do |t|
      t.integer :student_id
      t.integer :assignment_id
    end
  end
end
