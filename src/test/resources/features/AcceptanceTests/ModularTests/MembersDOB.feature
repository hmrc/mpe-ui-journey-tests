@acceptance @regression
Feature:As a PSA/PSP User
  I want to login and navigate to Member's Date Of Birth Page

  Scenario Outline: Happy Path Journey - Navigate to Member's Date Of Birth Page and enter valid Date Of Birth
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "What you'll need" page
    When I click the "Continue" link
    Then I should be on the "Member name" page
    When I fill in the "firstName" field with "Pearl"
    And I fill in the "lastName" field with "Turner Harvey"
    And I click the "Continue" button
    Then I should be on the "What is the member's date of birth?" page
    And I should see hint text "For example, 27 03 1970" on the page
    When I fill in the "dateOfBirth.day" field with "5"
    And I fill in the "dateOfBirth.month" field with "1"
    And I fill in the "dateOfBirth.year" field with "1987"
    And I click the "Continue" button
    Then I should be on the "What is the member's National Insurance number?" page

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: Happy Path Journey - Navigate to Member's NINO Page and click on 'Back' button
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "What you'll need" page
    When I click the "Continue" link
    Then I should be on the "Member name" page
    When I fill in the "firstName" field with "Pearl"
    And I fill in the "lastName" field with "Turner Harvey"
    And I click the "Continue" button
    Then I should be on the "What is the member's date of birth?" page
    When I fill in the "dateOfBirth.day" field with "05"
    And I fill in the "dateOfBirth.month" field with "12"
    And I fill in the "dateOfBirth.year" field with "1987"
    And I click the "Continue" button
    Then I should be on the "What is the member's National Insurance number?" page
    When I click the "Back" link
    Then I should be on the "What is the member's date of birth?" page

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: Unhappy path journey's for Member's Date Of Birth Page for a valid PSA User
    Given I have a new session
    When I fill in the auth details for enrolment PSA with value A2100001
    Then I should be on the "What you'll need" page
    When I click the "Continue" link
    Then I should be on the "Member name" page
    When I fill in the "firstName" field with "Pearl"
    And I fill in the "lastName" field with "Turner Harvey"
    And I click the "Continue" button
    Then I should be on the "What is the member's date of birth?" page
    When I fill in the "dateOfBirth.day" field with "<Day>"
    And I fill in the "dateOfBirth.month" field with "<Month>"
    And I fill in the "dateOfBirth.year" field with "<Year>"
    And I click the "Continue" button
    Then I should be on the "<page>" page
    And I should see "<error>" error on the page
    And  The error link should show "<error>"
    And  I click the "<error>" error link

    Examples:
      | Day | Month | Year | page                                       | error                                                                 |
      | abc | 03    | 2007 | Error: What is the member's date of birth? | Enter a valid day. A day should be in between 1 to 31                 |
      | 27  | abc   | 2007 | Error: What is the member's date of birth? | Enter a valid month. A month should be in between 1 to 12             |
      | 27  | 03    | abc  | Error: What is the member's date of birth? | Enter a valid year. A year should be in between 1900 and current year |
      |     | 03    | 2007 | Error: What is the member's date of birth? | Enter a day of birth                                                  |
      | 27  |       | 2007 | Error: What is the member's date of birth? | Enter a month of birth                                                |
      | 27  | 03    |      | Error: What is the member's date of birth? | Enter a year of birth                                                 |
      | 27  | 03    | 2099 | Error: What is the member's date of birth? | Enter a valid year. A year should be in between 1900 and current year |
      | 1   | 1     | 1899 | Error: What is the member's date of birth? | Enter a valid year. A year should be in between 1900 and current year |

  Scenario Outline: Unhappy path journey's for Member's Date Of Birth Page for a valid PSP User
    Given I have a new session
    When I fill in the auth details for enrolment PSP with value 2100002
    Then I should be on the "What you'll need" page
    When I click the "Continue" link
    Then I should be on the "Member name" page
    When I fill in the "firstName" field with "Pearl"
    And I fill in the "lastName" field with "Turner Harvey"
    And I click the "Continue" button
    Then I should be on the "What is the member's date of birth?" page
    When   I fill in the "dateOfBirth.day" field with "<Day>"
    And   I fill in the "dateOfBirth.month" field with "<Month>"
    And   I fill in the "dateOfBirth.year" field with "<Year>"
    And I click the "Continue" button
    Then I should be on the "<page>" page
    And I should see "<error>" error on the page
    And  The error link should show "<error>"
    And  I click the "<error>" error link

    Examples:
      | Day | Month | Year | page                                       | error                                                                 |
      | abc | 03    | 2007 | Error: What is the member's date of birth? | Enter a valid day. A day should be in between 1 to 31                 |
      | 27  | abc   | 2007 | Error: What is the member's date of birth? | Enter a valid month. A month should be in between 1 to 12             |
      | 27  | 03    | abc  | Error: What is the member's date of birth? | Enter a valid year. A year should be in between 1900 and current year |
      |     | 03    | 2007 | Error: What is the member's date of birth? | Enter a day of birth                                                  |
      | 27  |       | 2007 | Error: What is the member's date of birth? | Enter a month of birth                                                |
      | 27  | 03    |      | Error: What is the member's date of birth? | Enter a year of birth                                                 |
      | 27  | 03    | 2099 | Error: What is the member's date of birth? | Enter a valid year. A year should be in between 1900 and current year |
      | 1   | 1     | 1899 | Error: What is the member's date of birth? | Enter a valid year. A year should be in between 1900 and current year |
