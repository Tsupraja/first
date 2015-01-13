class Home < SitePrism::Page
  set_url "http://localhost:3000/departments/new"
  #set_url_matcher "/new"
  element :name_field, "input[name='department[name]']"
  element :des_field, "input[name='department[description]']"
  element :click_button, "button[name='commit']"
end
