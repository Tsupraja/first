require './spec/fact/section/login_section.rb'
require './spec/fact/section/top_menu_section.rb'

class Coupa < SitePrism::Page
	set_url "https://sail.coupadev.com"
  set_url_matcher "/sessions/new"
section :login1, Login, "div.login"
section :top, Home_top_Section, "#topNav"
#section :
end

