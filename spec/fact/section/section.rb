class Login < SitePrism::Section
	
  element :input_name, "input[name='user[login]']"
  element :input_password, "input[name='user[password]']"
  element :c_button, "button[type='submit']"
end