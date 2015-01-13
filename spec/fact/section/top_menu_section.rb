class Home_top_Section < SitePrism::Section
	element :signout_link, "a[href='/sessions/destroy']"
	element :cart_link, "a[href='/requisition_headers/edit_cart']"
end