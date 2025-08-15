@e2e
Feature:As a PSA/PSP User
  I want to login and navigate to Results Page

  Scenario Outline: Happy Path Journey - Navigate to Results page and verify if the members details are matched successfully for the Protections with valid NINO
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "Check a pension scheme member's protections and enhancements" page
    When I click the "Start now" link
    Then I should be on the "What is the member's name?" page
    When I fill in the "firstName" field with "John"
    And I fill in the "lastName" field with "Smith"
    And I click the "Continue" button
    Then I should be on the "What is the member's date of birth?" page
    When I fill in the "dateOfBirth.day" field with "10"
    And I fill in the "dateOfBirth.month" field with "9"
    And I fill in the "dateOfBirth.year" field with "1954"
    And I click the "Continue" button
    Then I should be on the "What is the member's National Insurance number?" page
    When I fill in the "nino" field with "JX 99 99 99 A"
    And I click the "Continue" button
    Then I should be on the "What is the member's pension scheme administrator check reference?" page
    And I fill in the "psaCheckRef" field with "PSA 12 34 56 78 A"
    And I click the "Continue" button
    Then I should be on the "Check your answers" page
    When I click the "Submit" button
    Then I should be on the "Results of protections and enhancements check" page
    And I should see the following values on the page
      | value             |
      | John Smith        |
      | 10 September 1954  |
      | JX 99 99 99 A     |
      | PSA 12 34 56 78 A |
    And I should see the following links on the page
      | links                                                              |
      | Managing pension schemes                                           |
      | Check a pension scheme member’s protections and enhancements       |
      | Check another pension scheme member's protections and enhancements |
      | Return to Managing pension schemes dashboard                       |
    And I should see the "Print this page" button on the page
    And The Checked On time stamp should display current date and time
    And The "Protection" tables contain:
      | Type                | Status                                           | Protected amount | Lump Sum | Factor | Protection reference number |
      | Enhanced protection | Active - the protection is valid and can be used |                  | 12%      |        | 1234567A                    |

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |

  Scenario Outline: Happy Path Journey - Navigate to Results page and verify if the members details are matched successfully for the Protection and Enhancements with valid TRN number
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
   Then I should be on the "Check a pension scheme member's protections and enhancements" page
    When I click the "Start now" link
    Then I should be on the "What is the member's name?" page
    When I fill in the "firstName" field with "Tim"
    And I fill in the "lastName" field with "Thomas"
    And I click the "Continue" button
    Then I should be on the "What is the member's date of birth?" page
    When I fill in the "dateOfBirth.day" field with "29"
    And I fill in the "dateOfBirth.month" field with "11"
    And I fill in the "dateOfBirth.year" field with "1963"
    And I click the "Continue" button
    Then I should be on the "What is the member's National Insurance number?" page
    When I fill in the "nino" field with "22B67890"
    And I click the "Continue" button
    Then I should be on the "What is the member's pension scheme administrator check reference?" page
    And I fill in the "psaCheckRef" field with "PSA56781234W"
    And I click the "Continue" button
    Then I should be on the "Check your answers" page
    When I click the "Submit" button
    Then I should be on the "Results of protections and enhancements check" page
    And I should see the following values on the page
      | value             |
      | Tim Thomas        |
      | 29 November 1963  |
      | 22 B6 78 90       |
      | PSA 56 78 12 34 W |
    And The "Protection" tables contain:
      | Type                                                                | Status                                            | Protected amount | Lump Sum | Enhancement factor | Protection reference number |
      | Enhanced protection                                                 | Active - the protection is valid and can be used  |                  | 28%      |                    | EPRO3456789012A             |
      | Non-residence factor for a transfer from an overseas pension scheme | Active - the enhancement is valid and can be used |                  |          | 0.75               | IE242345678901A             |

    Examples:
    | enrolmentID | enrolmentValue |
    | PSP         | 21000002       |

  Scenario Outline: Happy Path Journey - Navigate to Results page and verify if the members details are matched successfully for multiple Protections and Enhancements
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
   Then I should be on the "Check a pension scheme member's protections and enhancements" page
    When I click the "Start now" link
    Then I should be on the "What is the member's name?" page
    When I fill in the "firstName" field with "Pearl"
    And I fill in the "lastName" field with "Brown"
    And I click the "Continue" button
    Then I should be on the "What is the member's date of birth?" page
    When I fill in the "dateOfBirth.day" field with "2"
    And I fill in the "dateOfBirth.month" field with "12"
    And I fill in the "dateOfBirth.year" field with "1939"
    And I click the "Continue" button
    Then I should be on the "What is the member's National Insurance number?" page
    When I fill in the "nino" field with "NW999999A"
    And I click the "Continue" button
    Then I should be on the "What is the member's pension scheme administrator check reference?" page
    And I fill in the "psaCheckRef" field with "PSA67812345W"
    And I click the "Continue" button
    Then I should be on the "Check your answers" page
    When I click the "Submit" button
    Then I should be on the "Results of protections and enhancements check" page
    And I should see the following values on the page
      | value             |
      | Pearl Brown       |
      | 02 December 1939  |
      | NW 99 99 99 A     |
      | PSA 67 81 23 45 W |
    And The "Protection" tables contain:
      | Type                                                                | Status                                                                                                            | Protected amount | Lump sum | Enhancement factor | Protection reference number |
      | Fixed protection 2016                                               | Active - the protection is valid and can be used                                                                  |                  |          |                    | FP163456789012A             |
      | Non-residence factor for a transfer from an overseas pension scheme | Active - the enhancement is valid and can be used                                                                 |                  |          | 0.23               | IE243456789012A             |
      | Non-residence factor for a relevant overseas individual             | Active - the enhancement is valid and can be used                                                                 |                  |          | 0.12               | IE211234567890A             |
      | Pension credit factor for pre-commencement pension credit rights    | Active - the enhancement is valid and can be used                                                                 |                  |          | 0.09               | PCRD1234567890A             |
      | Pension credit factor for previously crystallised rights            | Active - the enhancement is valid and can be used                                                                 |                  |          | 0.06               | PCRD2345678901A             |
      | Individual protection 2016                                          | Dormant - the protection is approved, but a higher level of protection is currently in place, so it is not active | £1,249,231       |          |                    |                             |
      | Fixed protection 2016                                               | Withdrawn - the protection has been lost, so it is not valid                                                      |                  |          |                    | FP161098274657A             |
      | Primary protection                                                  | Withdrawn - the protection has been lost, so it is not valid                                                      |                  | £189,321 | 0.45               | 2345678W                    |

    Examples:
    | enrolmentID | enrolmentValue |
    | PSA         | A2100001       |
