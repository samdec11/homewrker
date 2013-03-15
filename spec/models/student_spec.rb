require 'spec_helper'

describe Student do
  describe '.new' do
    it 'creates an instance of Student' do
      student = Student.new
      expect(student).to be_an_instance_of(Student)
    end
  end
  describe '#assignments' do
    it 'has assignments' do
      assignment = Assignment.new
      student = Student.new
      student.assignments << assignment
      expect(student.assignments.first).to be_an_instance_of(Assignment)
    end
  end
  describe '#groups' do
    it 'has groups' do
      group = Group.new
      student = Student.new
      student.groups << group
      expect(student.groups.first).to be_an_instance_of(Group)
    end
  end
  describe '.create' do
    it 'has an id' do
      student = Student.create(name: 'Bob')
      expect(student.id).to_not be nil
    end
    it 'fails validation if name is blank' do
      student = Student.create
      expect(student.id).to be nil
    end
  end
end