def find_in_list(query_string)
  query_result = query(query_string)
  while query_result.empty?
    performAction('scroll_down')
    query_result = query(query_string)
  end
  return query_result
end

def touch_in_list(query)
  touch(find_in_list(query))
end
