@acceptance @regression
Feature:As a PSA/PSP User
  I want to login and navigate to Results Page

  Scenario Outline: Happy Path Journey - Navigate to Results page and verify if the members details are matched successfully for the Protections
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "Check a member's protections and enhancements" page
    When I click the "Start now" link
    Then I should be on the "What is the member's name?" page
    When I fill in the "firstName" field with "Pearl"
    And I fill in the "lastName" field with "Turner Harvey"
    And I click the "Continue" button
    Then I should be on the "What is Pearl Turner Harvey's date of birth?" page
    When I fill in the "dateOfBirth.day" field with "5"
    And I fill in the "dateOfBirth.month" field with "1"
    And I fill in the "dateOfBirth.year" field with "1987"
    And I click the "Continue" button
    Then I should be on the "What is Pearl Turner Harvey's National Insurance number?" page
    When I fill in the "nino" field with "QQ123456C"
    And I click the "Continue" button
    Then I should be on the "What is Pearl Turner Harvey's pension scheme administrator check reference?" page
    And I fill in the "psaCheckRef" field with "PSA 12 34 56 78 A"
    And I click the "Continue" button
    Then I should be on the "Check Pearl Turner Harvey's details" page
    When I click the "Accept and submit" link
    Then I should be on the "Results of your protections and enhancements check" page
    And I should see the following values on the page
      | value               |
      | Pearl Turner Harvey |
      | 05 January 1987     |
      | QQ 12 34 56 C       |
      | PSA 12 34 56 78 A   |
    And I should see the following links on the page
      | links                                               |
      | MPS dashboard                                       |
      | Check another member's protections and enhancements |
      | More information on pension protections             |
      | Print this page                                     |
    And The Checked On time stamp should display current date and time
    Given The "Protection" tables contain:
      | Type                       | Status                                                                                                                    | Protected amount | Lump sum | Factor | Protection reference number |
      | Individual protection 2014 | Active - The protection is valid and can be used                                                                          | £1,440,321       |          |        | IP141234567890A             |
      | Fixed protection 2016      | Dormant - The protection is approved, but a higher level of protection is currently in place, it cannot currently be used |                  |          |        | FP1612345678901A            |
      | Primary protection         | Withdrawn - The protection has been lost, so it is not valid                                                              |                  | £34,876  | 0.21   | IP141234567890A             |

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: Happy Path Journey - Navigate to Results page and verify if the members details are matched successfully for the Enhancements
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "Check a member's protections and enhancements" page
    When I click the "Start now" link
    Then I should be on the "What is the member's name?" page
    When I fill in the "firstName" field with "Pearl"
    And I fill in the "lastName" field with "Turner Harvey"
    And I click the "Continue" button
    Then I should be on the "What is Pearl Turner Harvey's date of birth?" page
    When I fill in the "dateOfBirth.day" field with "5"
    And I fill in the "dateOfBirth.month" field with "1"
    And I fill in the "dateOfBirth.year" field with "1987"
    And I click the "Continue" button
    Then I should be on the "What is Pearl Turner Harvey's National Insurance number?" page
    When I fill in the "nino" field with "QQ123456C"
    And I click the "Continue" button
    Then I should be on the "What is Pearl Turner Harvey's pension scheme administrator check reference?" page
    And I fill in the "psaCheckRef" field with "PSA 12 34 56 78 A"
    And I click the "Continue" button
    Then I should be on the "Check Pearl Turner Harvey's details" page
    When I click the "Accept and submit" link
    Then I should be on the "Results of your protections and enhancements check" page
    And I should see the following values on the page
      | value               |
      | Pearl Turner Harvey |
      | 05 January 1987     |
      | QQ 12 34 56 C       |
      | PSA 12 34 56 78 A   |
    And I should see the following links on the page
      | links                                               |
      | MPS dashboard                                       |
      | Check another member's protections and enhancements |
      | More information on pension protections             |
      | Print this page                                     |
    And The Checked On time stamp should display current date and time
    Given The "Enhancement" tables contain:
      | Type                                                                | Status                                            | Protected amount | Lump sum | Enhancement factor | Protection reference number |
      | Non-residence factor for a transfer from an overseas pension scheme | Active - The enhancement is valid and can be used |                  |          | 0.12               | IE211234567890A             |

  Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: Happy Path Journey - Change the 'First Name' and verify if the updated details are displayed on Results Page
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "Check a member's protections and enhancements" page
    When I click the "Start now" link
    Then I should be on the "What is the member's name?" page
    When I fill in the "firstName" field with "Pearl"
    And I fill in the "lastName" field with "Turner Harvey"
    And I click the "Continue" button
    Then I should be on the "What is Pearl Turner Harvey's date of birth?" page
    When I fill in the "dateOfBirth.day" field with "5"
    And I fill in the "dateOfBirth.month" field with "1"
    And I fill in the "dateOfBirth.year" field with "1987"
    And I click the "Continue" button
    Then I should be on the "What is Pearl Turner Harvey's National Insurance number?" page
    When I fill in the "nino" field with "QQ123456C"
    And I click the "Continue" button
    Then I should be on the "What is Pearl Turner Harvey's pension scheme administrator check reference?" page
    And I fill in the "psaCheckRef" field with "PSA 12 34 56 78 A"
    And I click the "Continue" button
    Then I should be on the "Check Pearl Turner Harvey's details" page
    When I click the "Accept and submit" link
    Then I should be on the "Results of your protections and enhancements check" page
    When I click the "Back" link
    Then I should be on the "Check Pearl Turner Harvey's details" page
    When I click on the Change link for "First name"
    Then I should be on the "What is the member's name?" page
    When I fill in the "firstName" field with "David"
    And I click the "Continue" button
    Then I should be on the "Check David Turner Harvey's details" page
    When I click the "Accept and submit" link
    Then I should be on the "Results of your protections and enhancements check" page

    And I should see the following values on the page
      | value               |
      | David Turner Harvey |
      | 05 January 1987     |
      | QQ 12 34 56 C       |
      | PSA 12 34 56 78 A   |
    And I should see the following links on the page
      | links                                               |
      | MPS dashboard                                       |
      | Check another member's protections and enhancements |
      | More information on pension protections             |
      | Print this page                                     |
    And The Checked On time stamp should display current date and time

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: Happy Path Journey - Navigate to Results and click on 'MPS Dashboard' link.
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "Check a member's protections and enhancements" page
    When I click the "Start now" link
    Then I should be on the "What is the member's name?" page
    When I fill in the "firstName" field with "Pearl"
    And I fill in the "lastName" field with "Turner Harvey"
    And I click the "Continue" button
    Then I should be on the "What is Pearl Turner Harvey's date of birth?" page
    When I fill in the "dateOfBirth.day" field with "5"
    And I fill in the "dateOfBirth.month" field with "1"
    And I fill in the "dateOfBirth.year" field with "1987"
    And I click the "Continue" button
    Then I should be on the "What is Pearl Turner Harvey's National Insurance number?" page
    When I fill in the "nino" field with "QQ123456C"
    And I click the "Continue" button
    Then I should be on the "What is Pearl Turner Harvey's pension scheme administrator check reference?" page
    And I fill in the "psaCheckRef" field with "PSA 12 34 56 78 A"
    And I click the "Continue" button
    Then I should be on the "Check Pearl Turner Harvey's details" page
    When I click the "Accept and submit" link
    Then I should be on the "Results of your protections and enhancements check" page
    When I click the "MPS dashboard" link
#   TODO Then I should be on the "Administrator Dashboard" page

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: Happy Path Journey - Navigate to Results page and click on 'Check another member's protections and enhancements' link.
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "Check a member's protections and enhancements" page
    When I click the "Start now" link
    Then I should be on the "What is the member's name?" page
    When I fill in the "firstName" field with "Pearl"
    And I fill in the "lastName" field with "Turner Harvey"
    And I click the "Continue" button
    Then I should be on the "What is Pearl Turner Harvey's date of birth?" page
    When I fill in the "dateOfBirth.day" field with "5"
    And I fill in the "dateOfBirth.month" field with "1"
    And I fill in the "dateOfBirth.year" field with "1987"
    And I click the "Continue" button
    Then I should be on the "What is Pearl Turner Harvey's National Insurance number?" page
    When I fill in the "nino" field with "QQ123456C"
    And I click the "Continue" button
    Then I should be on the "What is Pearl Turner Harvey's pension scheme administrator check reference?" page
    And I fill in the "psaCheckRef" field with "PSA 12 34 56 78 A"
    And I click the "Continue" button
    Then I should be on the "Check Pearl Turner Harvey's details" page
    When I click the "Accept and submit" link
    Then I should be on the "Results of your protections and enhancements check" page
    When I click the "Check another member's protections and enhancements" link
    Then I should be on the "Check a member's protections and enhancements" page

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: Happy Path Journey - Navigate to Results page and click on 'More information on pension protections' link.
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "Check a member's protections and enhancements" page
    When I click the "Start now" link
    Then I should be on the "What is the member's name?" page
    When I fill in the "firstName" field with "Pearl"
    And I fill in the "lastName" field with "Turner Harvey"
    And I click the "Continue" button
    Then I should be on the "What is Pearl Turner Harvey's date of birth?" page
    When I fill in the "dateOfBirth.day" field with "5"
    And I fill in the "dateOfBirth.month" field with "1"
    And I fill in the "dateOfBirth.year" field with "1987"
    And I click the "Continue" button
    Then I should be on the "What is Pearl Turner Harvey's National Insurance number?" page
    When I fill in the "nino" field with "QQ123456C"
    And I click the "Continue" button
    Then I should be on the "What is Pearl Turner Harvey's pension scheme administrator check reference?" page
    And I fill in the "psaCheckRef" field with "PSA 12 34 56 78 A"
    And I click the "Continue" button
    Then I should be on the "Check Pearl Turner Harvey's details" page
    When I click the "Accept and submit" link
    Then I should be on the "Results of your protections and enhancements check" page
    When I click the "More information on pension protections" link
    Then I should be on the "Taking higher tax-free lump sums with protected allowances" page

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: Happy Path Journey - Navigate to Results page and click on Back button.
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "Check a member's protections and enhancements" page
    When I click the "Start now" link
    Then I should be on the "What is the member's name?" page
    When I fill in the "firstName" field with "Pearl"
    And I fill in the "lastName" field with "Turner Harvey"
    And I click the "Continue" button
    Then I should be on the "What is Pearl Turner Harvey's date of birth?" page
    When I fill in the "dateOfBirth.day" field with "5"
    And I fill in the "dateOfBirth.month" field with "1"
    And I fill in the "dateOfBirth.year" field with "1987"
    And I click the "Continue" button
    Then I should be on the "What is Pearl Turner Harvey's National Insurance number?" page
    When I fill in the "nino" field with "QQ123456C"
    And I click the "Continue" button
    Then I should be on the "What is Pearl Turner Harvey's pension scheme administrator check reference?" page
    And I fill in the "psaCheckRef" field with "PSA 12 34 56 78 A"
    And I click the "Continue" button
    Then I should be on the "Check Pearl Turner Harvey's details" page
    When I click the "Accept and submit" link
    Then I should be on the "Results of your protections and enhancements check" page
    When I click the "Back" link
    Then I should be on the "Check Pearl Turner Harvey's details" page

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |




