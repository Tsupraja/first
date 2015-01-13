require "rails_helper"
module Dept
begin
 session = Capybara::Session.new(:selenium)
 A={data: session}
end
def get
	A[:data]
end
step  "I am opening localhost" do
session.visit "http://localhost:3000/departments"
session.has_content?('Listing departments')
end
step "there's a Department name with description" do
   
 session.click_link('New Department')
POST = FactoryGirl.build(:department)
         
        session.fill_in('Name', :with => POST.name)
         session.fill_in('Description', :with => POST.description)   
         session.click_button('Create Department') 
         session.has_content?('Department was successfully created.')  
         session.click_link('Back')   
puts "passed 1"  
end

step "there's a Department name with description second" do
   
 session.click_link('New Department')
POST1 = FactoryGirl.build(:department)
         
        session.fill_in('Name', :with => POST1.name)
         session.fill_in('Description', :with => POST1.description)   
         session.click_button('Create Department') 
         session.has_content?('Department was successfully created.')  
         session.click_link('Back')   
puts "passed 1"  
end
 
step "the name  and description should be same what we gave" do 
d=Department.last
#e="/departments/#{d.id}/edit"

session.find(:xpath,"//a[@href"+"='/departments/#{d.id}/edit']").click

#post = Post.find_by_name(name)
session.has_content?(POST.name)
session.has_content?(POST.description)
session.click_link('Back')
puts "passed 2"
end
 step "I enter the given description :description" do |description|
 #session.click_link('Edit')
d=Department.last
session.find(:xpath,"//a[@href"+"='/departments/#{d.id}/edit']").click

session.fill_in('Description', :with => '')
#p= FactoryGirl.create(:department,description: description)
session.fill_in('Description', :with => description) 
session.click_button('Update Department')
session.has_content?('Department was successfully updated.')
end



end
RSpec.configure { |c| c.include Dept}

