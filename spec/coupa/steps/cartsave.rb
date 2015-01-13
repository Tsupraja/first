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
@home.input_name.set "coupasupport"
@home.input_password.set "CoupaSupport1"
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
@page2.itema.click
end
step "enter item name is :item1" do |item1|
@page2.itemname.set item1
sleep 10
@page2.execute_script("$('.ui-menu-item a:contains(\"dell_1212\")').trigger('mouseenter').click();")
sleep 5
end

end
 RSpec.configure { |c| c.include Coupa }    