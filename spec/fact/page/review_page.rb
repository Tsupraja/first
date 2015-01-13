require './spec/fact/section/review_shipto_section.rb'
require './spec/fact/section/review_cartitem_section.rb'
class Review < SitePrism::Page
section :shipto,Shipto,"#shipTo"
elements :cho_button, '.stripe_even td:last-child  a'
section :cartitem,Cartitems,"#requisition-cart"

element :submitforapproval, "button[id='submit_for_approval_link']" 
end
