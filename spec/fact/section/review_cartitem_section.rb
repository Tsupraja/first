class Cartitems < SitePrism::Section
	element :account_magnifier, '.account_code.show' 
	element :account_enter, '#autocomplete_code'
    element :choose_button, "a[class='rollover button']"
    element :addline, "a[id='add_requisition_line_link']"
    element :itema, "input[id='requisition_line_line_type_requisitionquantityline']"
    element :service, "input[id='requisition_line_line_type_requisitionamountline']"
    element :itemname, "input[name='requisition_line[description]']"
    element :supplier, "input[id='requisition_line_supplier_search']"
    #element :supplier, "option[selected='']"
    element :commodity, "span[class ='false']"
    element :price, "input[name='requisition_line[unit_price]']"
    element :cart_button,"button[class='button blue right save']"
    element :qty, "input[id='requisition_line_quantity']"
    element :unspsc, "input[id='requisition_line_unspsc_code']"
end