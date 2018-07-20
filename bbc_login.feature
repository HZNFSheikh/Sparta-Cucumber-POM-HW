Feature: BBC Login

  # Scenario: Inputting incorrect username and incorrect password credentials shows an error
  #   Given I access the bbc login page
  #     And I input incorrect username details
  #     And I input incorrect password details
  #   When I try to Login
  #   Then I receive an error

  Scenario Outline: Inputting correct username and incorrect password credentials shows an error
    Given I access the bbc login page
      And I input correct username details
      And I input incorrect password details <password>
    When I try to Login
    Then I receive the following error: <error>

    Examples:
    | password | error |
    | abcdefg | Sorry, that password is too short. It needs to be eight characters or more. |
    | 12345678 | Sorry, that password isn't valid. Please include a letter. |
    | | Something's missing. Please check and try again. |
    | abcdefgh | Sorry, that password isn't valid. Please include something that isn't a letter. |
    | ascdefgh1234567890987654321234567890987654321234567 | Sorry, that password is too long. It can't be more than 50 characters. |
