require 'spec_helper'

describe 'Assignments' do
  describe 'GET /' do
    it 'displays assignments link' do
      visit root_path
      page.should have_link('Assignments')
    end
  end
  describe 'GET /assignments' do
    it 'goes to the assignments page' do
      visit root_path
      click_link('Assignments')
      current_path.should == assignments_path
    end
    it 'displays new assignment link' do
      visit assignments_path
      page.should have_link('New Assignment')
    end
  end
  describe 'GET /assignments/new' do
    it 'shows the new assignment form', :js => true do
      visit assignments_path
      click_link('New Assignment')
      page.should have_button('Create Assignment')
      page.should have_button('Cancel')
    end
    it 'clears the form when the cancel button is pressed', :js => true do
      visit assignments_path
      click_link('New Assignment')
      click_button('Cancel')
      page.should_not have_button('Create Assignment')
    end
  end
  describe 'POST /assignments' do
    it 'creates a new assignment after clicking the Create Assignment button', :js => true do
      23.times do
        Student.create(name: 'Bob')
      end
      visit assignments_path
      click_link('New Assignment')
      fill_in('Name', :with => 'Rockr')
      fill_in('Groupsize', :with => 2)
      click_button('Create Assignment')
      page.should_not have_button('Create Assignment')
      page.should have_link('Rockr')
      page.should have_text('2')
      expect(Assignment.first.name).to eq 'Rockr'
      expect(Assignment.first.groupsize).to eq 2
      expect(Assignment.first.groups.count).to eq 11
      expect(Assignment.first.groups.first.students.count).to eq 2
      expect(Assignment.first.groups.last.students.count).to eq 3
    end
  end
  describe 'GET /assignments/#' do
    it 'goes to the show page for the clicked assignment', :js => true do
      assignment = Assignment.create(name: 'Rockr', groupsize: 2)
      visit assignments_path
      click_link('New Assignment')
      fill_in('Name', :with => 'Rockr')
      fill_in('Groupsize', :with => 2)
      click_button('Create Assignment')
      click_link('Rockr')
      current_path.should == assignment_path(assignment)
    end
    it 'shows groups for the selected assignment' do
      assignment = Assignment.create(name: 'Rockr', groupsize: 2)
      group = Group.create(name: 'Group 1')
      student = Student.create(name: 'Bob')
      group.students << student
      assignment.groups << group
      visit assignment_path(assignment)
      page.should have_text('Group 1')
      page.should have_text('Bob')
    end
  end
end