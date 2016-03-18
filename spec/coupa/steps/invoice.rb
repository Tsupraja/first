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
step "I click orders tab" do
  @pagea.has_order?
  @pagea.order.click
end
  step "Purchase Orders page should be opened" do
    @page1=Orders.new
    expect(@page1).to have_content('Purchase Orders')
end
step "I click on AB00001555 link" do
  @page1.has_po?
  @page1.po.click
end
  step   "Purchase Order page should opened" do
  @page2=Ab00001555.new
 expect(@page2).to have_content('Purchase Order #AB00001555')

  end
     step "I click invoice link" do
     @page2.has_invoice?
     @page2.invoice.click 
     end

    step  "Create Invoice page should be opened" do
    @page3=Createinvoice.new
    expect(@page3).to have_content('Create Invoice')
    end
step "I enter all required details" do
     @page3.in.set "inv1214"
     @page3.qty.set "20"
     @page3.two.choose('two')
    

end  
     step "press submit button" do
      @page3.find_link('Submit').click
    end
     step  "Invoices page should be opened by creating" do
      @page4=Invoices.new
expect(@page4).to have_content('Invoice #inv1214is approved.')
expect(@page4).to have_content('inv1214')
@pagea.has_order?
@pagea.order.click
end
step "2Purchase Orders page should be opened" do
    @page1=Orders.new
    expect(@page1).to have_content('Purchase Orders')
end
step "2I click on AB00001555 link" do
  @page1.has_po?
  @page1.po.click
end
  step   "2Purchase Order page should opened" do
   @page2=Ab00001555.new
 expect(@page2).to have_content('Purchase Order #AB00001555')

  end
     step "2I click invoice link" do
     @page2.has_invoice?
     @page2.invoice.click 
     end

    step  "2Create Invoice page should be opened" do
     @page3=Createinvoice.new
    expect(@page3).to have_content('Create Invoice')
    end
step "2I enter all required details" do
     @page3.in.set "inv1215"
     @page3.qty.set "30"
     @page3.two.choose('one')
    

end  
     step "2press submit button" do
      @page3.find_link('Submit').click
    end
     step  "2Invoices page should be opened by creating" do
      @page4=Invoices.new
expect(@page4).to have_content('Invoice #inv1215 is approved.')
expect(@page4).to have_content('inv1215')
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