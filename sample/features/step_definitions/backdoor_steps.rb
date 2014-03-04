require 'calabash-android/cucumber'
require '../calabalash-utils'

Given /^I run the BackdoorSample app$/ do
  reinstall_apps
  start_test_server_in_background
end


When(/^I use backdoor$/) do
  send_broadcast('com.krazyrobot.sample.login', string_param('username', 'balazs'), string_param('pwd', 'querty'))
end


Then(/^the fields should be filled with text$/) do
  fail if query("EditText id:'email_edittext'", :getText)[0].empty?
  fail if query("EditText id:'pwd_edittext'", :getText)[0].empty?
end