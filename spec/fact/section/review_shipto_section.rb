class Shipto < SitePrism::Section
	element :address, "a[href='/addresses/picker?hide_attention=true']"
	
	end