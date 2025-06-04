@acceptance @regression
Feature:As a PSA/PSP User
  I want to login and navigate to Results Page

  Scenario Outline: Happy Path Journey - Navigate to Results page and verify if the members details are matched successfully for the Protections
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
    And I fill in the "psaCheckRef" field with "PSA 12 34 56 78 A"
    And I click the "Continue" button
    Then I should be on the "Check the member's details" page
    When I click the "Submit" link
    Then I should be on the "Results of protections and enhancements check" page
    And I should see the following values on the page
      | value               |
      | Pearl Turner Harvey |
      | 05 January 1987     |
      | JX 99 99 99 A       |
      | PSA 12 34 56 78 A   |
    And I should see the following links on the page
      | links                                                              |
      | Managing Pension Schemes                                           |
      | Check a pension scheme member’s protections and enhancements       |
      | Check another pension scheme member's protections and enhancements |
      | Managing pension schemes dashboard                                 |
    And I should see the "Print this page" button on the page
    And The Checked On time stamp should display current date and time
    And The "Protection" tables contain:
      | Type                       | Status                                                                                                            | Protected amount | Lump sum | Factor | Protection reference number |
      | Individual Protection 2014 | Active - the protection is valid and can be used                                                                  | £1,440,321       |          |        | IP141234567890A             |
      | Fixed Protection 2016      | Dormant - the protection is approved, but a higher level of protection is currently in place, so it is not active |                  |          |        | FP1612345678901A            |
      | Primary Protection         | Withdrawn - the protection has been lost, so it is not valid                                                      |                  | £34,876  | 0.21   | IP141234567890A             |

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: Happy Path Journey - Navigate to Results page and verify if the members details are matched successfully for the Enhancements
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
    # TODO Add TRN below once the issue between Frontend, Backend and NPS Stub is fixed
    When I fill in the "nino" field with "JX999999A"
    And I click the "Continue" button
    Then I should be on the "What is the member's pension scheme administrator check reference?" page
    And I fill in the "psaCheckRef" field with "PSA 12 34 56 78 A"
    And I click the "Continue" button
    Then I should be on the "Check the member's details" page
    When I click the "Submit" link
    Then I should be on the "Results of protections and enhancements check" page
    And I should see the following values on the page
      | value               |
      | Pearl Turner Harvey |
      | 05 January 1987     |
      | JX 99 99 99 A       |
      | PSA 12 34 56 78 A   |
    And I should see the following links on the page
      | links                                                              |
      | Managing Pension Schemes                                           |
      | Check a pension scheme member’s protections and enhancements       |
      | Check another pension scheme member's protections and enhancements |
      | Managing pension schemes dashboard                                 |
    And I should see the "Print this page" button on the page
    And The Checked On time stamp should display current date and time
    And The "Enhancement" tables contain:
      | Type                                                                           | Status                                            | Protected amount | Lump sum | Enhancement factor | Protection reference number |
      | International Enhancement (transfer from a recognised overseas pension scheme) | Active - the enhancement is valid and can be used | £1,440,321       |          | 0.12               | IE211234567890A             |

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: Happy Path Journey - Navigate to Results and click on 'Managing Pension Schemes' link.
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
    And I fill in the "psaCheckRef" field with "PSA 12 34 56 78 A"
    And I click the "Continue" button
    Then I should be on the "Check the member's details" page
    When I click the "Submit" link
    Then I should be on the "Results of protections and enhancements check" page
    When I click the "Managing Pension Schemes" link
#   TODO Then I should be on the "Administrator Dashboard" page

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |


  Scenario Outline: Happy Path Journey - Navigate to Results page and click on 'Check a member's protections and enhancements' link.
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
    And I fill in the "psaCheckRef" field with "PSA 12 34 56 78 A"
    And I click the "Continue" button
    Then I should be on the "Check the member's details" page
    When I click the "Submit" link
    Then I should be on the "Results of protections and enhancements check" page
    When I click the "Check a pension scheme member’s protections and enhancements" link
    Then I should be on the "What you'll need" page

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: Happy Path Journey - Navigate to Results page and click on 'Check another pension scheme member's protections and enhancements' link.
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
    And I fill in the "psaCheckRef" field with "PSA 12 34 56 78 A"
    And I click the "Continue" button
    Then I should be on the "Check the member's details" page
    When I click the "Submit" link
    Then I should be on the "Results of protections and enhancements check" page
    When I click the "Check another pension scheme member's protections and enhancements" link
    Then I should be on the "What you'll need" page

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: Happy Path Journey - Navigate to Results and click on 'Managing pension schemes dashboard' link.
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
    And I fill in the "psaCheckRef" field with "PSA 12 34 56 78 A"
    And I click the "Continue" button
    Then I should be on the "Check the member's details" page
    When I click the "Submit" link
    Then I should be on the "Results of protections and enhancements check" page
    When I click the "Managing pension schemes dashboard" link
#   TODO Then I should be on the "Administrator Dashboard" page

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |
