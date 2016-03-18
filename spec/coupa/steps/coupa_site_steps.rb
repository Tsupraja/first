require 'spec_helper'
require './spec/fact/coupa_site_page.rb'
module Coupa

	Capybara.register_driver :selenium do |app| 
   profile = Selenium::WebDriver::Firefox::Profile.new 
   Capybara::Selenium::Driver.new( app, :browser => :firefox, :profile => profile ) 
end
Capybara.default_driver = :selenium
step "I am on login page of coupa" do

@home = Login.new
puts "below"
 @home.load
#@home.wait_for_search_field(10)
@home.input_name
 @home.secure? 
 @home.has_input_name?
 @home.has_input_password?
 @home.has_c_button?
#puts @home.has_no_search_field?

end
step "I enter valid login details" do
@home.input_name.set "new"
@home.input_password.set "new1"
@home.wait_for_c_button(10)
end

step "Press Sign In button" do
@home.c_button.click
end

step "Home page should be viewed" do
       @page=Home.new
      # @page.load
       @page.has_so_link? 
end

step "I clicked Expenses tab" do
     @page.has_expense?
     @page.expense.click

end

step "Expenses page should be opened" do
	@page1=Expenses.new
	#@page1.load
	#@page1.has_exp?
	@page1.has_ex_link?
	end
step "I press sign out link" do
	  @page.wait_for_so_link()
	  @page.so_link.click

end	
    
     
step "It should redireted to main page" do
    #@a.has_content?('You have been logged out.')
    @home.has_input_name?
     end
end
RSpec.configure { |c| c.include Coupa}

