require 'spec_helper'
require './spec/fact/page/login.rb'
require './spec/fact/page/home.rb'
require './spec/fact/page/review_page.rb'
require './spec/fact/page/setup_page.rb'
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
step "click on setup tab and setup page should be opened" do
@home.primary.setup.click
@setup=Setup.new
expect(@setup).to have_content('Administration')

end     
step "click on Company information link and company information page should be opened" do
@setup.company_information.click
expect(@setup).to have_content('Company Information')
end
step "click Route requisitions to buyer if no contract is specified on that checkbox" do
  @setup.no_contract.set(true)
    
end
step "when non-backed lines exceeded setting amount" do
  @setup.non_backed_lines_exceeded.click
  @setup.amountvalue.set "100.00" 
  end
step "saving the company_information after some changes" do
  @setup.company_save.click
end  
step "In home page click on cart link which is on right side of home page" do
       @home.top.cart_link.click
end    
step "Review Cart page  should be opened" do
  @review=Review.new
 expect(@review).to have_content('Review Cart')
end
step "Enter the ship in address at top of review page" do
 sleep 3
 @review.shipto.address.click
  sleep 5
  @review.cho_button[3].click
   sleep 5
  end
step "Click on add line link at below" do
  @review.cartitem.has_addline?
  @review.cartitem.addline.click
end
step "Choose item in radio buttons" do
@review.cartitem.wait_until_itema_visible(10)
@review.cartitem.itema.click
end
step "Enter itemname,supplier,prices,commodity" do
  @review.cartitem.itemname.set "mouce"
  sleep 5
 @review.cartitem.execute_script("$('.ui-menu-item a:contains(\"mouce\")').trigger('mouseenter').click();")
  @review.cartitem.price.set "100.00"
  @review.cartitem.qty.set "2"
end
step "press save button to save item" do
 @review.cartitem.cart_button.click
end
step "fill the Accounting details in cartlist section" do
 @review.cartitem.wait_until_account_magnifier_visible(10)
 @review.cartitem.account_magnifier.click
     @review.cartitem.account_enter.set "Japan"
    sleep 5
    @review.cartitem.execute_script("$('.ui-menu-item a:contains(\"Japan-Chicago\")').trigger('mouseenter').click();")
  sleep 5  
end
step "click on submit for approval" do
  @review.submitforapproval.click
end
step "It will redirect to home page after given to approval" do
@home.left.wait_until_recent_item_visible(10)
  @home.left.recent_item[1].click
end
end
 RSpec.configure {|c| c.include Main}