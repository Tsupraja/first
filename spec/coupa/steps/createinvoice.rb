require 'spec_helper'
require './spec/fact/coupa_site_page.rb'
module Coupa 
 
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
@home.input_name.set "supraja"
@home.input_password.set "sairam1212"
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
step "enter remaining values" do
@page2.qty.set "1"
@page2.unspsc.set "first"
sleep 5

end

step "press save button" do
@num1=@page1.cartnumber.text
puts @num1
@page2.cart_button.click
sleep 5
end
step "checking the card no is changed or not" do
@num2=@page1.cartnumber.text
@page1.cartnumber.text.should > @num1
puts @num2
end
step "checking wheather dell_1212 is saved or not" do
 expect(@page1).to have_content('dell_1212') 
end
step "Adding the address for shipping" do
  @page1.address.click
  sleep 5
   @page1.cho_button[3].click
   sleep 5
end
step "filling Accounting data clicking submit for approval" do
  @page1.account_magnifier.click
     @page1.account_enter.set "Japan"
    sleep 5
    @page1.execute_script("$('.ui-menu-item a:contains(\"Japan-Chicago\")').trigger('mouseenter').click();")
  sleep 5
  @page1.submitforapproval.click
  sleep 2
end
step "check whether that it item is there are not and clicking bypass" do
 @pagea.recent_item[1].click
    sleep 7
    @pagea.find_link('Bypass Approvals and Order').click
    sleep 5
end

step "In home page clicking invoice tab" do
@pagea.invoices.click
@pagei=Invoicepage.new
@pagei.createinvoice.click
end
step "In invoice page clicking on Pick lines from PO link" do
@pagea.find_link('Pick lines from PO').click
end
step "pick your supplier and add in invoice table" do
  @pagei=Invoices.new
  @pagei.line.click
  sleep 2
  @pagei.find_link('Finish').click
end
step "creating invoice to supplier which you add" do

@pagei.in.set "inv1215"

@pagei.two.choose('one')

@pagei.find_link("Submit").click
sleep 5
@pagei.save_button.click
    sleep 7
@pagei.bypass_approval.click
    sleep 10
end
step "checking it is created or not" do
expect(@page1).to have_content('i1212')

end

end
 RSpec.configure { |c| c.include Coupa }    