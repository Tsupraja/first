require './spec/fact/section/login_section.rb'
class Coupa < SitePrism::Page
	set_url "https://sail.coupadev.com"
  set_url_matcher "/sessions/new"
section :login1, Login, "div.login"
end

