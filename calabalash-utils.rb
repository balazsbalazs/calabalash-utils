# Finds and returns an element in a list even if the element is not on screen.
# You specify the element by the query parameter. The function scrolls down the list the element is found.
# If the element can't be found an empty array is returned.
def find_in_list(query_string)
  query_result = query(query_string)
  current_screen_state = query('*')
  prev_screen_state = []

  while (query_result.empty? and current_screen_state != prev_screen_state)
    prev_screen_state = current_screen_state
    performAction('scroll_down')
    query_result = query(query_string)
    current_screen_state = query('*')
  end

  return query_result
end


# Touches an element in a list even if the element is not on screen.
# You specify the element by the query parameter. The function scrolls down the list the element is found.
def touch_in_list(query)
  touch(find_in_list(query))
end


# Scrolls a scrollable view to the top of the view.
def scroll_to_top
  result = query('*')

  begin
    last_result = result
    performAction('scroll_up')
    result = query('*')
  end while (result != last_result)

end