require './spec/fact/section/top_menu_section.rb'
require './spec/fact/section/recentorder_section.rb'
require './spec/fact/section/home_primary_section.rb'
class Home < SitePrism::Page
section :top, Home_top_Section, "#topNav"
section :primary, Primary, "nav.primary"
section :left,Recent_order,"#leftColumn"
#section :right,ToDos,"div.region todos"
end
