require 'calabash-android/cucumber'
require '../calabalash-utils'

Given /^I run the apiDemos app$/ do
  reinstall_apps
  start_test_server_in_background
end

When /^I select "(.*)" in the list$/ do |item|
  touch_in_list("* text:'#{item}'")
end

Then(/^I see "([^"]*)" in the list$/) do |item|
  if find_in_list("* text:'#{item}'").empty?
    fail("Can't find '#{item}' in the list")
  end
end

And(/^I scroll down to "([^"]*)" item$/) do |item|
  find_in_list("* text:'#{item}'")
end

And(/^I scroll to the top$/) do
  scroll_to_top
end

And(/^"([^"]*)" is on the screen$/) do |item|
  wait_for_elements_exist(["* text:'#{item}'"])
end

Then(/^I can't find "([^"]*)" in the list$/) do |item|
  if not find_in_list("* text:'#{item}'").empty?
    fail("Element #{item} was found in the list")
  end
end

And(/^I scroll to the bottom$/) do
  scroll_to_bottom
end