require 'spec_helper'

describe Assignment do
  describe '.new' do
    it 'creates an instance of Assignment' do
      assignment = Assignment.new
      expect(assignment).to be_an_instance_of(Assignment)
    end
  end
  describe '#students' do
    it 'has students' do
      assignment = Assignment.new
      student = Student.new
      assignment.students << student
      expect(assignment.students.first).to be_an_instance_of(Student)
    end
  end
  describe '#groups' do
    it 'has groups' do
      assignment = Assignment.new
      group = Group.new
      assignment.groups << group
      expect(assignment.groups.first).to be_an_instance_of(Group)
    end
  end
  describe '.create' do
    it 'has an id' do
      assignment = Assignment.create(name: 'Rockr', groupsize: 2)
      expect(assignment.id).to_not be nil
    end
    it 'fails validation if name and group size are blank or group size is not greater than 0' do
      assignment = Assignment.create(groupsize: 0)
      expect(assignment.id).to be nil
    end
  end
end