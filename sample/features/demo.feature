Feature: Demonstrating the features of calabalash-utils

Scenario: Finding something in a list
  Given I run the apiDemos app
  When I select "Views" in the list
  Then I see "Lists" in the list

