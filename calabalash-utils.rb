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
  scroll_to_top_or_bottom(:up)
end


# Scrolls a scrollable view to the bottom of the view.
def scroll_to_bottom
  scroll_to_top_or_bottom(:down)
end


def scroll_to_top_or_bottom(direction)
  current_screen_state = query('*')

  begin
    prev_screen_state = current_screen_state
    case direction
      when :up
        performAction('scroll_up')
      when :down
        performAction('scroll_down')
    end
    current_screen_state = query('*')
  end while (current_screen_state != prev_screen_state)
end


def send_broadcast(action, *params)
  shell_cmd = default_device.adb_command
  cmd = "#{shell_cmd} shell am broadcast -a #{action}"
  params.each { |param|
    cmd << " #{param[:switch]} #{param[:name]} #{param[:param]}"
  }
  system cmd
end

def int_param(name, param)
  {switch: '--ei', name: "#{name}", param: param}
end

def bool_param(name, param)
  {switch: '--ez', name: "#{name}", param: param}
end

def string_param(name, param)
  {switch: '--es', name: "#{name}", param: param}
end

