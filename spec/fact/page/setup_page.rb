class Setup < SitePrism::Page
	element :company_information, "a[href='/administration/company?address_table[filter]=1']"
	element :draft_supplier, "input[id='draft_supplier']"
	element :no_contract , "input[id='no_contract']"
	element :item_save, "button[class='ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only']"
	element :company_save, "button[class='button blue']"
	element :non_backed_lines_exceeded,"input[id='no_contract_method_lines_exceeded']"
	element :amountvalue, "input[id='no_contract_lines_exceeded_amount']"
end