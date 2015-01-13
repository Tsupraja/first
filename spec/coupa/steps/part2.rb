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
step "check whether that it item is there are not" do
 @a=@pagea.co_po.value
 sleep 3
end
end
 RSpec.configure { |c| c.include Coupa }    