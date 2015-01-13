class Login < SitePrism::Page
  set_url "https://sail.coupadev.com"
  set_url_matcher "/sessions/new"

  element :input_name, "input[name='user[login]']"
  element :input_password, "input[name='user[password]']"
  element :c_button, "button[type='submit']"
end
class Home < SitePrism::Page

element :so_link, "a[href='/sessions/destroy']"
element :expense, "a[href='/expense_reports/home']"
element :setup, "a[href='/administration/home']"
element :order, "a[href='/order_headers']"
element :cart, "a[href='/requisition_headers/edit_cart']"
element :co_po, '#recent_reqs .line:first .smallText a'
element :invoices, "a[ href='/invoices']"
elements :recent_item, '#recent_reqs div:first-child'
end
class Expenses < SitePrism::Page
	
element :exp, "text[id='page-container']"
element :ex_link, "a[ href='/expense_reports']"
end
class Setup < SitePrism::Page
element :coa, "a[href='/account_types']"
element :s_search, "input[id='instant_setup_search']"
end
class Chatofaccounts < SitePrism::Page
	element :c_search, "input[name='search']"
	element :create, "a[href='/account_types/new']"
	#element :coa, contains: 'Blue COA' 
end
class Createchatofaccount < SitePrism::Page
	element :name, "input[name='account_type[name]']"
	element :currency, "select[name='account_type[currency_id]']" 
	element :segment, "input[name='account_type[segment_1_field_type]']"
	element :check1, "input[name='account_type[use_requester_as_billing_contact]']"
	element :check2,"input[name='account_type[use_ship_to_as_bill_to]']"
	element :create_button, "button[type='submit']"
end
class Orders < SitePrism::Page
	element :po, "a[href='/order_headers/1555']"
end
class Ab00001555 < SitePrism::Page
	element :invoice, "a[href='/invoices/flip_po/1555']"
end
class Createinvoice < SitePrism::Page
     
 end     
class Invoices < SitePrism::Page
element :line, "#order_line_table_tag tr:last-child td:last-child a"
 element :in, "input[name='invoice[invoice_number]']"
      element :qty,"input[class=' quantity_field_input']"
element :invoiceno, "input[id='invoice_invoice_number']"
element :two, "div[id='invoice_invoice_lines_attributes_6082_custom_field_9_one']" 
element :save_button, "#update_invoice"
element :bypass_approval, '.ui-dialog-buttonset button', text: "Bypass Approvals"

end

class Invoicepage < SitePrism::Page
element :createinvoice, "a[href='/invoices/new']"
end
class Review < SitePrism::Page
	element :addline, "a[id='add_requisition_line_link']"
	element :s_link, "a[href='/sessions/destroy']"
	element :cartnumber, "span[id='cartNum']"
	element :quantity, "span[id='requisition_total_quantity']"
	element :address, "a[href='/addresses/picker?hide_attention=true']"
	 elements :cho_button, '.stripe_even td:last-child  a'
	
    element :choose_button, "a[class='rollover button']"
     element :submitforapproval, "button[id='submit_for_approval_link']" 
      element :account_magnifier, '.account_code.show' 
	element :account_enter, '#autocomplete_code'
end
class Pagesub< SitePrism::Page
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
    element :suppartno, "input[id='requisition_line_source_part_num']"
    element :shipping, "select[ id='requisition_line_shipping_term_id']"
    element :asset, "input[id='requisition_line_assets_as_string']"
    element :payment, "select[name='requisition_line[payment_term_id]']"
    element :needby,"input[id='requisition_line_need_by_date']"
    element :pcard, "input[id='requisition_line_custom_field_3']"
    element :comment, "textarea[id='requisition_line_custom_field_2']"
    element :karma, "input[id='requisition_line_custom_field_4']"

end	
