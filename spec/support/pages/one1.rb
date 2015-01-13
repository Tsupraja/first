class HomePage < SitePrism::Page
  # elements previously defined
  def search_for(query, scope='All departments')
    search_dropdown.select(scope)
    search_field.set(query)
    click_on('Search')
 SearchResults.new # <--------- Added this! -----

  end
end
