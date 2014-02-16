Feature: Demonstrating the features of calabalash-utils

  Scenario: Finding something in a list
    Given I run the apiDemos app
    And "Accessibility" is on the screen
    When I select "Views" in the list
    And "Animation" is on the screen
    Then I see "Lists" in the list

  Scenario: Checking that something is not in the list
    Given I run the apiDemos app
    And "Accessibility" is on the screen
    When I select "Views" in the list
    And "Animation" is on the screen
    Then I can't find "Not in list" in the list

  Scenario: Scroll the list to top
    Given I run the apiDemos app
    And "Accessibility" is on the screen
    When I select "Views" in the list
    And "Animation" is on the screen
    And I scroll down to "Lists" item
    And I scroll to the top
    Then "Animation" is on the screen

