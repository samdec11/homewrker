require 'spec_helper'

describe 'Students' do
  describe 'GET /' do
    it 'displays students link' do
      visit root_path
      page.should have_link('Students')
    end
  end
  describe 'GET /students' do
    it 'goes to the students page' do
      visit root_path
      click_link('Students')
      current_path.should == students_path
    end
    it 'displays new student link' do
      visit students_path
      page.should have_link('New Student')
    end
  end
  describe 'GET /students/new' do
    it 'shows the new student form', :js => true do
      visit students_path
      click_link('New Student')
      page.should have_button('Create Student')
      page.should have_button('Cancel')
    end
    it 'clears the form when the cancel button is pressed', :js => true do
      visit students_path
      click_link('New Student')
      click_button('Cancel')
      page.should_not have_button('Create Student')
    end
  end
  describe 'POST /students' do
    it 'creates a new student after clicking the Create Student button', :js => true do
      visit students_path
      click_link('New Student')
      fill_in('Name', :with => 'Bob')
      click_button('Create Student')
      page.should_not have_button('Create Student')
      page.should have_text('Bob')
      expect(Student.first.name).to eq 'Bob'
    end
  end
end