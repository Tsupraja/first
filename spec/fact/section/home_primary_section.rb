class Primary < SitePrism::Section
	element :homeimage, "a[href='/user/home']"
    element	:expenses, "a[href='/expense_reports/home']"
	element :requests, "a[href='/requisition_headers']"
	element :orders, "a[href='/order_headers']"
	element :invoices, "a[href='/invoices']"
	element :inventory, "a[href='/inventory']"
    element :sourcing, "a[href='/quotes/requests']"
    element :suppliers, "a[href='/suppliers']"
    element :items, "a[href='/items']"
    element :reports, "a[href='/dashboard']"
    element :setup, "a[href='/administration/home']"
end