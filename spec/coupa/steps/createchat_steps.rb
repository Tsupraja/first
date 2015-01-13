require 'spec_helper'
require './spec/fact/coupa_site_page.rb'
module Coupa

	#Capybara.register_driver :selenium do |app| 
   #profile = Selenium::WebDriver::Firefox::Profile.new 
#Capybara::Selenium::Driver.new( app, :browser => :firefox, :profile => profile )   
 

Capybara.register_driver :selenium do |app|
  http_client = Selenium::WebDriver::Remote::Http::Default.new
  http_client.timeout = 400
  Capybara::Selenium::Driver.new(app, :browser => :firefox, :http_client => http_client)
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
@home.input_name.set "coupasupport"
@home.input_password.set "CoupaSupport1"
#
#@home.wait_for_c_button()
end

step "Press Sign In button" do
@home.c_button.click
end

step "Home page should be viewed" do
       @pagea=Home.new
      # @page.load
      @pagea.wait_for_so_link()
       @pagea.has_so_link? 
       sleep 5
end
step "I clicked Setup tab" do
      @pagea.has_setup?
      @pagea.setup.click
end
step "Setup page should be opened" do
	@page1=Setup.new
	#@page1.has_s_search?
	 expect(@page1).to have_content('Administration')
end
step "I click  Chart of accounts" do
   @page1.has_coa?
   @page1.coa.click 
end
step "Chart of Accounts page should be opened" do
	@page2=Chatofaccounts.new
	#@page2.has_c_search
	expect(@page2).to have_content('Chart of Accounts') 
end

step "I click create  button" do
	@page2.has_create?
	@page2.create.click
end
 step "create  Chart Of Accounts page should be opened" do
 	@page3=Createchatofaccount.new
 	#@page3.has_name?
    expect(@page3).to have_content(' Chart Of Accounts Create') 
 end
step "create new chart of accounts" do
	@page3.name.set "COUPA1212"
	@page3.currency.select("USD")
    @page3.segment.set "Seg 1"
    @page3.check1.click
    @page3.check2.click

end
step "I press save button" do
	@page3.create_button.click
end
 step "It should be redirected be Chart of Accounts page" do
      #@page2.has_c_search?
      expect(@page2).to have_content('Chart of Accounts was successfully created.') 
      puts "hello"
      expect(@page2).to have_content('COUPA1212')
      @page2.find_link("COUPA1212").click
      puts "hello1"
      #@page2.pagen.click
      puts "hello3"
 end


 step 'Edit new  Chart Of Account' do
 	puts "hello 1"
expect(@page2).to have_content('COUPA1212')
puts "hello 2"
      @page2.find_link('COUPA1212').click
      puts "hello3"
      @edit=Epage.new
      puts "hello 4"
      @edit.find_link('Edit').click
 end
step 'Delete new  Chart Of Account' do
puts "hello5"
@edit.find_link('Delete').click
puts "hello6"
page.driver.browser.switch_to.alert.accept
#@edit.driver.browser.switch_to.alert.accept
 #page.driver.accept_js_confirms!
 expect(@page2).to have_content('Removed Chart of Accounts and associated accounts.') 
 
 end

 




step "I press sign out link" do
	  
	  @pagea.so_link.click

end	
    
     
step "It should redireted to main page" do
    expect(@home).to have_content('You have been logged out.')
    #@home.has_input_name?
     end
end
 RSpec.configure { |c| c.include Coupa }    