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
step "Choose item" do
@page2=Pagesub.new
@page2.wait_until_itema_visible(10)
@page2.itema.click
end
step "enter item name is :item1" do |item1|
@page2.itemname.set item1
sleep 10
@page2.execute_script("$('.ui-menu-item a:contains(\"dell_1212\")').trigger('mouseenter').click();")
sleep 5
end
step "entering the Supplier :gsup Commodity :gcom Price :gpri" do |gsup,gcom,gpri|
tempsupplier=@page2.supplier.text
puts tempsupplier
tempcommodity=@page2.commodity.text
puts tempcommodity
tempprice=@page2.price.value
puts tempprice
@page2.supplier.text.should eql gsup
@page2.commodity.text.should eql gcom 
@page2.price.value.should eql gpri
puts "they are equal"
end
step "I press sign out link" do
     @pagea.wait_for_so_link()
    @pagea.has_so_link?
    @pagea.so_link.click
     sleep 5
end 
step "It should redireted to main page" do
    expect(@home).to have_content('You have been logged out.')
   
     end
end
 RSpec.configure { |c| c.include Coupa }    