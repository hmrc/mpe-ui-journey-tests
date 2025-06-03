@acceptance @regression
Feature:As a PSA/PSP User
  I want to login and navigate to Member's Pension Scheme Administrator Check Reference Page

  Scenario Outline: Happy Path Journey - Navigate to Member's PSA Check Reference Page and enter valid PSA Check Reference number without blanks
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "What you'll need" page
    When I click the "Continue" link
    Then I should be on the "Member name" page
    When I fill in the "firstName" field with "Pearl"
    And I fill in the "lastName" field with "Turner Harvey"
    And I click the "Continue" button
    Then I should be on the "What is the member's date of birth?" page
    When I fill in the "dateOfBirth.day" field with "5"
    And I fill in the "dateOfBirth.month" field with "1"
    And I fill in the "dateOfBirth.year" field with "1987"
    And I click the "Continue" button
    Then I should be on the "What is the member's National Insurance number?" page
    When I fill in the "nino" field with "JX999999A"
    And I click the "Continue" button
    Then I should be on the "What is the member's pension scheme administrator check reference?" page
    And I should see hint text "For example, PSA 12 34 56 78 A" on the page
    And I fill in the "psaCheckRef" field with "PSA 12 34 56 78 A"
    And I click the "Continue" button
    Then I should be on the "Check the member's details" page

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |


  Scenario Outline: Happy Path Journey - Navigate to Member's PSA Check Reference Page and enter valid PSA Check Reference number with Blanks
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "What you'll need" page
    When I click the "Continue" link
    Then I should be on the "Member name" page
    When I fill in the "firstName" field with "Pearl"
    And I fill in the "lastName" field with "Turner Harvey"
    And I click the "Continue" button
    Then I should be on the "What is the member's date of birth?" page
    When I fill in the "dateOfBirth.day" field with "5"
    And I fill in the "dateOfBirth.month" field with "1"
    And I fill in the "dateOfBirth.year" field with "1987"
    And I click the "Continue" button
    Then I should be on the "What is the member's National Insurance number?" page
    When I fill in the "nino" field with "JX999999A"
    And I click the "Continue" button
    Then I should be on the "What is the member's pension scheme administrator check reference?" page
    And I fill in the "psaCheckRef" field with " P S A 1 2 3 4 5 6 7 8 A "
    And I click the "Continue" button
    Then I should be on the "Check the member's details" page

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: Happy Path Journey - Navigate to Check Your Answers Page and click on 'Back' button
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
    When I fill in the "nino" field with "JX999999A"
    And I click the "Continue" button
    Then I should be on the "What is the member's pension scheme administrator check reference?" page
    And I fill in the "psaCheckRef" field with "PSA12345678A"
    And I click the "Continue" button
    Then I should be on the "Check the member's details" page
    When I click the "Back" link
    Then I should be on the "What is the member's pension scheme administrator check reference?" page

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: Unhappy path journey's for Member's PSA Check Reference Number Page for a valid PSA User
    Given I have a new session
    When I fill in the auth details for enrolment PSA with value A2100001
    Then I should be on the "What you'll need" page
    When I click the "Continue" link
    Then I should be on the "Member name" page
    When I fill in the "firstName" field with "Pearl"
    And I fill in the "lastName" field with "Turner Harvey"
    And I click the "Continue" button
    Then I should be on the "What is the member's date of birth?" page
    When I fill in the "dateOfBirth.day" field with "5"
    And I fill in the "dateOfBirth.month" field with "1"
    And I fill in the "dateOfBirth.year" field with "1987"
    And I click the "Continue" button
    Then I should be on the "What is the member's National Insurance number?" page
    When I fill in the "nino" field with "JX999999A"
    And I click the "Continue" button
    Then I should be on the "What is the member's pension scheme administrator check reference?" page
    And I fill in the "psaCheckRef" field with "<psaCheckRef>"
    And I click the "Continue" button
    Then I should be on the "<page>" page
    And I should see "<error>" error on the page
    And  The error link should show "<error>"
    And  I click the "<error>" error link

    Examples:
      | psaCheckRef   | page                                                                      | error                                                                             |
      | !@£$%^&*()"   | Error: What is the member's pension scheme administrator check reference? | Enter the member's pension scheme administrator check reference in a valid format |
      |               | Error: What is the member's pension scheme administrator check reference? | Enter a pension scheme administrator check reference                              |
      | PSA1234567A   | Error: What is the member's pension scheme administrator check reference? | Enter the member's pension scheme administrator check reference in a valid format |
      | PS12345678    | Error: What is the member's pension scheme administrator check reference? | Enter the member's pension scheme administrator check reference in a valid format |
      | PSA12345678   | Error: What is the member's pension scheme administrator check reference? | Enter the member's pension scheme administrator check reference in a valid format |
      | PSA1234@5678A | Error: What is the member's pension scheme administrator check reference? | Enter the member's pension scheme administrator check reference in a valid format |
      | PSA12345678AA | Error: What is the member's pension scheme administrator check reference? | Enter the member's pension scheme administrator check reference in a valid format |
      | PSA1234A      | Error: What is the member's pension scheme administrator check reference? | Enter the member's pension scheme administrator check reference in a valid format |


  Scenario Outline: Unhappy path journey's for Member's PSA Check Reference Number Page for a valid PSP User
    Given I have a new session
    When I fill in the auth details for enrolment PSP with value 2100002
    Then I should be on the "What you'll need" page
    When I click the "Continue" link
    Then I should be on the "Member name" page
    When I fill in the "firstName" field with "Pearl"
    And I fill in the "lastName" field with "Turner Harvey"
    And I click the "Continue" button
    Then I should be on the "What is the member's date of birth?" page
    When I fill in the "dateOfBirth.day" field with "5"
    And I fill in the "dateOfBirth.month" field with "1"
    And I fill in the "dateOfBirth.year" field with "1987"
    And I click the "Continue" button
    Then I should be on the "What is the member's National Insurance number?" page
    When I fill in the "nino" field with "JX999999A"
    And I click the "Continue" button
    Then I should be on the "What is the member's pension scheme administrator check reference?" page
    And I fill in the "psaCheckRef" field with "<psaCheckRef>"
    And I click the "Continue" button
    Then I should be on the "<page>" page
    And I should see "<error>" error on the page
    And  The error link should show "<error>"
    And  I click the "<error>" error link

    Examples:
      | psaCheckRef   | page                                                                      | error                                                                             |
      | !@£$%^&*()"   | Error: What is the member's pension scheme administrator check reference? | Enter the member's pension scheme administrator check reference in a valid format |
      |               | Error: What is the member's pension scheme administrator check reference? | Enter a pension scheme administrator check reference                              |
      | PSA1234567A   | Error: What is the member's pension scheme administrator check reference? | Enter the member's pension scheme administrator check reference in a valid format |
      | PS12345678    | Error: What is the member's pension scheme administrator check reference? | Enter the member's pension scheme administrator check reference in a valid format |
      | PSA12345678   | Error: What is the member's pension scheme administrator check reference? | Enter the member's pension scheme administrator check reference in a valid format |
      | PSA1234@5678A | Error: What is the member's pension scheme administrator check reference? | Enter the member's pension scheme administrator check reference in a valid format |
      | PSA12345678AA | Error: What is the member's pension scheme administrator check reference? | Enter the member's pension scheme administrator check reference in a valid format |
      | PSA1234A      | Error: What is the member's pension scheme administrator check reference? | Enter the member's pension scheme administrator check reference in a valid format |

