require 'calabash-android/cucumber'
require '../calabalash-utils'

Given /^I run the apiDemos app$/ do
  reinstall_apps
  start_test_server_in_background
end

When /^I select "(.*)" in the list$/ do |item|
  wait_for_elements_exist(["* text:'App'"])
  touch_in_list("* text:'#{item}'")
end

Then(/^I see "([^"]*)" in the list$/) do |item|
  wait_for_elements_exist(["* text:'Animation'"])
  if find_in_list("* text:'#{item}'").nil?
    scenario.fail("Can't find '#{item}' in the list")
  end
end