Feature: BBC Registration

  Scenario: Selecting right age and inputting an incorrect Date of birth shows an error
    Given I access the bbc registration page
      And I select the correct age option
      And I input an incorrect date of birth <day> <month> <year>
    When I submit the date of birth
    Then I receive an error for an incorrect format <error>


  Scenario: Selecting the right age and entering a valid date of birth but entering an invalid email shows an error
    Given I access the bbc registration page
      And I select the correct age option
      And I input a date of birth with the correct format
      And I continue to the main registration page
      And I input an invalid email
      When I click on to the next input field
      Then I receive an error that the email is an invalid format

Examples:

| day | month | year | error |
| 01 | 08 | 19 | Oops, that year doesn't look right. Make sure it's a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009. |
| 01 | 19 | 19 | Oops, that month and year don't look right. Make sure it's a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009. |
| 98 | 14 | 1992 | Oops, that day and month don't look right. Make sure it's a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009. |
| 98 | 08 | 199 | Oops, that day and year don't look right. Make sure it's a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009. |
| 98 | 08 | 1992 | Oops, that day doesn't look right. Make sure it's a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009. |
|  |  |  | Oops, that date doesn't look right. Make sure it's a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009. |
