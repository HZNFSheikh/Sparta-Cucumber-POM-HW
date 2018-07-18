Feature: BBC Login

  Scenario: Inputting incorrect username and incorrect password credentials shows an error
    Given I access the bbc login page
      And I input incorrect username details
      And I input incorrect password details
    When I try to Login
    Then I receive an error

  Scenario: Inputting correct username and incorrect password credentials shows an error
    Given I access the bbc login page
      And I input correct username details
      And I input incorrect password details
    When I try to Login
    Then I receive an error saying the password doesn't match
