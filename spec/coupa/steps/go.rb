require 'spec_helper'
require './spec/fact/gopage.rb'
module Page
	Capybara.register_driver :selenium do |app| 
   profile = Selenium::WebDriver::Firefox::Profile.new 
   Capybara::Selenium::Driver.new( app, :browser => :firefox, :profile => profile ) 
end
Capybara.default_driver = :selenium
step "Opening department page" do

@home= Home.new
puts "below"
 @home.load
 puts "above"
#@home.name_field
@home.secure? 
puts @home.has_name_field?
puts @home.has_no_name_field?
@home.name_field.set "cse"
@home.des_field.set "computer"



end


end
RSpec.configure { |c| c.include Page}

