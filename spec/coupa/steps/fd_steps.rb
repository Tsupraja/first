
require "spec_helper"
module Coupa
begin
 session = Capybara::Session.new(:selenium)
end
  step "I am on login page of coupa" do
   
    session.visit "https://sail.coupadev.com"
puts "passed 1"
   end

     step "I enter valid login details" do
        session.fill_in('user[login]', :with => 'coupasupport')
         session.fill_in('user[password]', :with => 'CoupaSupport1')
 puts "passed 2"      
        end


    step "Press Sign In button" do
        session.click_button('Sign In')
 puts "passed 3"       
     end

       step "Home page should be viewed" do
       session.has_link? "Sign Out"
  puts "passed 4"    
   end
    step "I press Setup tab" do
    session.click_link('Setup')
   puts "passed 5"
  end
   step "Administration page should viewed" do
   session.has_content?('Administration')
   puts "passed 6"
   end      
   step "I click Departments link" do
   session.click_link('Departments')
   puts "passed 7"
   end
   step "Departments page should viewed" do
   session.has_content?('Departments')
   puts "passed 8"
  end
  step "I press create button" do
  session.click_link('Create')
  puts "passed 9"
   end
  step "Department Create page should be viewed" do
   session.has_content?('Department Create')
   puts "passed 10" 
  end
  step "I enter Department name" do
   temp="sales_#{(Time.now.to_f).to_s}"
   session.fill_in('department[name]',:with => temp) 
   puts "passed 11"
   end
  step "press save button" do
   session.click_button('Save')
   puts "passed 12"
   end
  step "Department page should be viewed by saving" do
  session.has_content?('Department was successfully created.')
  puts "passed 13"
  end
  step "I press sign out link" do
     session.click_link('Sign Out')
   puts "passed 14"  
   end
   step "It should redireted to main page" do
     session.has_content?('You have been logged out.')
    puts "passed 15" 
    end
end

RSpec.configure { |c| c.include Coupa}

