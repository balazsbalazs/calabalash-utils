Feature: Demonstrating the features of calabalash-utils

  Scenario: Using backdoor to set the login fields
    Given I run the BackdoorSample app
    When I use backdoor
    Then the fields should be filled with text
