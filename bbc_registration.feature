Feature: BBC Registration

  Scenario: Selecting right age and inputting an incorrect Date of birth shows an error
    Given I access the bbc registration page
      And I select the correct age option
      And I input an incorrect date of birth
    When I submit the date of birth
    Then I receive an error for an incorrect format


  Scenario: Selecting the right age and entering a valid date of birth but entering an invalid email shows an error
    Given I access the bbc registration page
      And I select the correct age option
      And I input a date of birth with the correct format
      And I continue to the main registration page
      And I input an invalid email
      When I click on to the next input field
      Then I receive an error that the email is an invalid format
