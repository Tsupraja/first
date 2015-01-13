require 'spec_helper'
require './spec/fact/page/login.rb'
require './spec/fact/page/home.rb'
require './spec/fact/page/review_page.rb'
module Main 

step "Open the login page of coupa" do
        @log = Coupa.new

        @log.load
        #@home.has.page1?
        @log.login1.input_name
        #@home.page1.secure? 
        @log.login1.has_input_name?
        @log.login1.has_input_password?
        @log.login1.has_c_button?
end
step "Enter the valid user name and password" do
      @log.login1.input_name.set "supraja"
      @log.login1.input_password.set "sairam1212"
end
step "press signin button to login" do
      @log.login1.c_button.click
end
step "Sign out link should be present" do
     @home=Home.new
  @home.top.wait_for_signout_link()
  @home.top.has_signout_link?
  sleep 5
end       
step "In home page click on cart link which is on right side of home page" do
       @home.top.cart_link.click
end    
step "Review Cart page  should be opened" do
  @review=Review.new
 expect(@review).to have_content('Review Cart')
end
step "In Review page Click on add line" do
  @review.cartitem.has_addline?
  @review.cartitem.addline.click
end
step "then Choose item in radio buttons" do
@review.cartitem.wait_until_itema_visible(10)
@review.cartitem.itema.click
end
step "enter item,supplier,Commodity,price" do
@review.cartitem.itemname.set "classmate"
@review.cartitem.supplier.set "books"
@review.cartitem.commodity.set "education"
@review.cartitem.price.set "20"
@review.cartitem.qty.set "4"
@review.cartitem.unspsc.set "test"
end
step "click on save button" do
  @review.cartitem.cart_button.click
 sleep 5
end
step "click on Submit for Approval" do
@review.submitforapproval.click
  sleep 2
  end
step "checking the test case process is passed or not" do
  expect(@review).to have_content('Fix the incomplete lines outlined in red')
  expect(@review).to have_content('Buyer Action Pending') 
end
end
 RSpec.configure {|c| c.include Main}