require "spec_helper"

module Dept

  	begin
  		session = Capybara::Session.new(:selenium)
	end
	step "Opening the url" do
  		session.visit 'http://localhost:3000/departments'	
  	end
	step "Click new department link" do
  		session.click_link('New Department')	
  	end
	step "It should asking to fill required data" do
  		session.has_content?('New department')
  	end
	

	step "Entering name as :name and description taken from factory girl" do |name|
  		dept = FactoryGirl.create(:department, name: name)
		session.fill_in('department[name]', :with => name)
		session.fill_in('department[description]', :with => dept.description)
		session.click_button('Create Department')
  	end

	step "It should add the department with name :name" do |name|
  		session.should have_content('Department was successfully created.')
		dept = Department.find_by_name(name)
  		session.should have_content(dept.name)
  		session.should have_content(dept.description)
		session.click_link('Back')
  	end
	step "I click on the Edit link" do
  		session.click_link('Edit')
  	end
	step "Update description with :name" do |name|
		session.fill_in('department[description]', :with =>'')
  		session.fill_in('department[description]', :with => name)
		session.click_button('Update Department')
  	end
  	step "It should be updated" do
		
		session.has_content?('Department was successfully updated.')		
			
  	end
	
		
	
	step "Back to the home page" do
		session.click_link('Back')
	end
  	
end
RSpec.configure { |c| c.include Dept }
