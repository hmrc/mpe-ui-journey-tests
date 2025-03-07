@acceptance @regression
Feature:As a PSA/PSP User
  I want to login and navigate to Member's National Insurance Number Page

  Scenario Outline: Happy Path Journey - Navigate to Member's NINO Page and enter valid NINO number without Blanks
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "Check a member's protections and enhancements" page
    When I click the "Start now" link
    Then I should be on the "What is the member's name?" page
    When I fill in the "firstName" field with "Pearl"
    And I fill in the "lastName" field with "Turner Harvey"
    And I click the "Continue" button
    Then I should be on the "What is the Pearl Turner Harvey's date of birth?" page
    When I fill in the "dateOfBirth.day" field with "5"
    And I fill in the "dateOfBirth.month" field with "1"
    And I fill in the "dateOfBirth.year" field with "1987"
    And I click the "Continue" button
    Then I should be on the "What is the Pearl Turner Harvey's National Insurance number?" page
    When I fill in the "nino" field with "QQ123456C"
    And I click the "Continue" button
    Then I should be on the "What is Member's pension scheme administrator check reference?" page

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: Happy Path Journey - Navigate to Member's NINO Page and enter valid NINO number with Blanks
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "Check a member's protections and enhancements" page
    When I click the "Start now" link
    Then I should be on the "What is the member's name?" page
    When I fill in the "firstName" field with "Pearl"
    And I fill in the "lastName" field with "Turner Harvey"
    And I click the "Continue" button
    Then I should be on the "What is the Pearl Turner Harvey's date of birth?" page
    When I fill in the "dateOfBirth.day" field with "5"
    And I fill in the "dateOfBirth.month" field with "1"
    And I fill in the "dateOfBirth.year" field with "1987"
    And I click the "Continue" button
    Then I should be on the "What is the Pearl Turner Harvey's National Insurance number?" page
    When I fill in the "nino" field with " Q Q 1 2 3 4 5 6 C "
    And I click the "Continue" button
    Then I should be on the "What is Member's pension scheme administrator check reference?" page

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: Happy Path Journey - Navigate to Member's Pension Scheme Administrator Check Reference Page and enter valid TRN number without blanks
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "Check a member's protections and enhancements" page
    When I click the "Start now" link
    Then I should be on the "What is the member's name?" page
    When I fill in the "firstName" field with "Pearl"
    And I fill in the "lastName" field with "Turner Harvey"
    And I click the "Continue" button
    Then I should be on the "What is the Pearl Turner Harvey's date of birth?" page
    When I fill in the "dateOfBirth.day" field with "5"
    And I fill in the "dateOfBirth.month" field with "1"
    And I fill in the "dateOfBirth.year" field with "1987"
    And I click the "Continue" button
    Then I should be on the "What is the Pearl Turner Harvey's National Insurance number?" page
    When I fill in the "nino" field with "11a11111"
    And I click the "Continue" button
    Then I should be on the "What is Member's pension scheme administrator check reference?" page

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: Happy Path Journey - Navigate to Member's Pension Scheme Administrator Check Reference Page and enter valid TRN number with blanks
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "Check a member's protections and enhancements" page
    When I click the "Start now" link
    Then I should be on the "What is the member's name?" page
    When I fill in the "firstName" field with "Pearl"
    And I fill in the "lastName" field with "Turner Harvey"
    And I click the "Continue" button
    Then I should be on the "What is the Pearl Turner Harvey's date of birth?" page
    When I fill in the "dateOfBirth.day" field with "5"
    And I fill in the "dateOfBirth.month" field with "1"
    And I fill in the "dateOfBirth.year" field with "1987"
    And I click the "Continue" button
    Then I should be on the "What is the Pearl Turner Harvey's National Insurance number?" page
    When I fill in the "nino" field with " 1 1 a 1 1 1 1 1 "
    And I click the "Continue" button
    Then I should be on the "What is Member's pension scheme administrator check reference?" page

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: Happy Path Journey - Navigate to Member's Pension Scheme Administrator's Check Reference Page and click on 'Back' button
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "Check a member's protections and enhancements" page
    When I click the "Start now" link
    Then I should be on the "What is the member's name?" page
    When I fill in the "firstName" field with "Pearl"
    And I fill in the "lastName" field with "Turner Harvey"
    And I click the "Continue" button
    Then I should be on the "What is the Pearl Turner Harvey's date of birth?" page
    When I fill in the "dateOfBirth.day" field with "05"
    And I fill in the "dateOfBirth.month" field with "12"
    And I fill in the "dateOfBirth.year" field with "1987"
    And I click the "Continue" button
    Then I should be on the "What is the Pearl Turner Harvey's National Insurance number?" page
    When I fill in the "nino" field with "QQ123456C"
    And I click the "Continue" button
    Then I should be on the "What is Member's pension scheme administrator check reference?" page
    When I click the "Back" link
    Then I should be on the "What is the Pearl Turner Harvey's National Insurance number?" page

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: Unhappy path journey's for Member's NINO Page for a valid PSA User
    Given I have a new session
    When I fill in the auth details for enrolment PSA with value A2100001
    Then I should be on the "Check a member's protections and enhancements" page
    When I click the "Start now" link
    Then I should be on the "What is the member's name?" page
    When I fill in the "firstName" field with "Pearl"
    And I fill in the "lastName" field with "Turner Harvey"
    And I click the "Continue" button
    Then I should be on the "What is the Pearl Turner Harvey's date of birth?" page
    When I fill in the "dateOfBirth.day" field with "5"
    And I fill in the "dateOfBirth.month" field with "1"
    And I fill in the "dateOfBirth.year" field with "1987"
    And I click the "Continue" button
    Then I should be on the "What is the Pearl Turner Harvey's National Insurance number?" page
    When I fill in the "nino" field with "<ninoNumber>"
    And I click the "Continue" button
    Then I should be on the "<page>" page
    And I should see "<error>" error on the page
    And  The error link should show "<error>"
    And  I click the "<error>" error link

    Examples:
      | ninoNumber    | page                                                                | error                                                                 |
      | QQ123456      | Error: What is the Pearl Turner Harvey's National Insurance number? | Please enter the member's National Insurance number in a valid format |
      | 12345678      | Error: What is the Pearl Turner Harvey's National Insurance number? | Please enter the member's National Insurance number in a valid format |
      | 12 QQ 34 56 C | Error: What is the Pearl Turner Harvey's National Insurance number? | Please enter the member's National Insurance number in a valid format |
      |               | Error: What is the Pearl Turner Harvey's National Insurance number? | Enter a National Insurance number                                     |

  Scenario Outline: Unhappy path journey's for Member's NINO Page for a valid PSP User
    Given I have a new session
    When I fill in the auth details for enrolment PSP with value 2100002
    Then I should be on the "Check a member's protections and enhancements" page
    When I click the "Start now" link
    Then I should be on the "What is the member's name?" page
    When I fill in the "firstName" field with "Pearl"
    And I fill in the "lastName" field with "Turner Harvey"
    And I click the "Continue" button
    Then I should be on the "What is the Pearl Turner Harvey's date of birth?" page
    When I fill in the "dateOfBirth.day" field with "5"
    And I fill in the "dateOfBirth.month" field with "1"
    And I fill in the "dateOfBirth.year" field with "1987"
    And I click the "Continue" button
    Then I should be on the "What is the Pearl Turner Harvey's National Insurance number?" page
    When I fill in the "nino" field with "<ninoNumber>"
    And I click the "Continue" button
    Then I should be on the "<page>" page
    And I should see "<error>" error on the page
    And  The error link should show "<error>"
    And  I click the "<error>" error link

    Examples:
      | ninoNumber    | page                                                                | error                                                                 |
      | QQ123456      | Error: What is the Pearl Turner Harvey's National Insurance number? | Please enter the member's National Insurance number in a valid format |
      | 12345678      | Error: What is the Pearl Turner Harvey's National Insurance number? | Please enter the member's National Insurance number in a valid format |
      | 12 QQ 34 56 C | Error: What is the Pearl Turner Harvey's National Insurance number? | Please enter the member's National Insurance number in a valid format |
      | a111111       | Error: What is the Pearl Turner Harvey's National Insurance number? | Please enter the member's National Insurance number in a valid format |
      | 111111a       | Error: What is the Pearl Turner Harvey's National Insurance number? | Please enter the member's National Insurance number in a valid format |
      | 1111a11       | Error: What is the Pearl Turner Harvey's National Insurance number? | Please enter the member's National Insurance number in a valid format |
      |               | Error: What is the Pearl Turner Harvey's National Insurance number? | Enter a National Insurance number                                     |
