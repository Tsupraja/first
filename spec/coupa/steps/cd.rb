require "spec_helper"
require "./spec/coupa/steps/local.rb"
module Delete
class Del
	include Dept
end
session=Del.new.get

step "the Department  which is creating before should be Destroy" do
	#session.click_link('Destroy')
	puts "delete module"
	d=Department.last
session.find(:xpath,"//a[@rel='nofollow' and @href"+"='/departments/#{d.id}']").click
end
step "conforming to delete the given department" do
session.driver.browser.switch_to.alert.accept
puts "hello"
end
step "checking whether it is deleted or not" do
	puts "first"
	#post = FactoryGirl.build(:department)
session.has_no_content?(POST.name)
#session.should_not have_content(post.name)
puts POST.name
end
end      
RSpec.configure { |c| c.include Delete}
