require 'spec_helper'
require './spec/fact/coupa_site_page.rb'
module Coupa 
 Capybara.register_driver :selenium do |app|
  http_client = Selenium::WebDriver::Remote::Http::Default.new
  http_client.timeout = 400
  Capybara::Selenium::Driver.new(app, :browser => :firefox, :http_client => http_client)
end
Capybara.default_driver = :selenium

step "I am on login page of coupa" do
@home = Login.new
        @home.load
        @home.input_name
        @home.secure? 
        @home.has_input_name?
        @home.has_input_password?
        @home.has_c_button?
end
step "I enter valid login details" do
@home.input_name.set "new"
@home.input_password.set "new1"
end
step "Press Sign In button" do
@home.c_button.click
end
step "Home page should be viewed" do
       @pagea=Home.new
       @pagea.wait_for_so_link()
       @pagea.has_so_link? 
       sleep 5
end
step "In home page click on cart link" do
       @pagea.cart.click
end    
step "Review Cart should be opened" do
  @page1=Review.new
 expect(@page1).to have_content('Review Cart')
end
step "Click on add line" do
  @page1.has_addline?
  @page1.addline.click
end
step "Choose service"  do
  @page2=Pagesub.new
@page2.wait_until_service_visible(10)
@page2.service.click
end
step "enter item,supplier,price values" do
@page2.itemname.set "dell_1212"
@page2.supplier.set "dellcompany"
@page2.price.set "32000.00"
expect(@page2).to_not have_content('Qty')
end
step "press save button" do
@numc1=@page1.cartnumber.text
puts @numc1
@numq1=@page1.quantity.text
puts @numq1
@page2.cart_button.click
sleep 5
end
step "checking quantity number is same or not" do
@numq2=@page1.quantity.text
@page1.quantity.text.should eql @numq1
puts @numq2
end

      step "I press sign out link" do
    @page1.has_s_link?
    @page1.s_link.click
    sleep 5
end 
    
     
step "It should redireted to main page" do
    expect(@home).to have_content('You have been logged out.')
    #@home.has_input_name?
     end
end
 RSpec.configure { |c| c.include Coupa }    