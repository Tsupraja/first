class Home < SitePrism::Page
  set_url "http://www.google.com"

  element :search_field, "input[name='q']"
end
