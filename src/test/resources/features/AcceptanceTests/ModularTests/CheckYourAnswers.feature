@acceptance @regression
Feature:As a PSA/PSP User
  I want to login and navigate to Check Your Answers Page

  Scenario Outline: Happy Path Journey - Navigate to Check Your Answers page and review the answers before submitting.
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
    And I fill in the "psaCheckRef" field with "PSA12345678A"
    And I click the "Continue" button
    Then I should be on the "Check Pearl Turner Harvey's details" page
    And I should see the following values on the page
      | value           |
      | Pearl           |
      | Turner Harvey   |
      | 05 January 1987 |
      | QQ 12 34 56 C   |
      | PSA12345678A    |
    When I click the "Accept and submit" link
    Then I should be on the "Results" page

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: Happy Path Journey - Navigate to Check Your Answers page and Change the 'First Name'.
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
    And I fill in the "psaCheckRef" field with "PSA12345678A"
    And I click the "Continue" button
    Then I should be on the "Check Pearl Turner Harvey's details" page
    When I click on the Change link for "First name"
    Then I should be on the "What is the member's name?" page
    When I fill in the "firstName" field with "David"
    And I click the "Continue" button
    Then I should be on the "Check David Turner Harvey's details" page
    And I should see the following values on the page
      | value           |
      | David           |
      | Turner Harvey   |
      | 05 January 1987 |
      | QQ 12 34 56 C   |
      | PSA12345678A    |

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: Happy Path Journey - Navigate to Check Your Answers page and Change the 'Last Name'.
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
    And I fill in the "psaCheckRef" field with "PSA12345678A"
    And I click the "Continue" button
    Then I should be on the "Check Pearl Turner Harvey's details" page
    When I click on the Change link for "Last name"
    Then I should be on the "What is the member's name?" page
    And I fill in the "lastName" field with "Williams"
    And I click the "Continue" button
    Then I should be on the "Check Pearl Williams's details" page
    And I should see the following values on the page
      | value           |
      | Pearl           |
      | Williams        |
      | 05 January 1987 |
      | QQ 12 34 56 C   |
      | PSA12345678A    |

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: Happy Path Journey - Navigate to Check Your Answers page and Change the 'Date Of Birth'.
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
    And I fill in the "psaCheckRef" field with "PSA12345678A"
    And I click the "Continue" button
    Then I should be on the "Check Pearl Turner Harvey's details" page
    When I click on the Change link for "Date of birth"
    Then I should be on the "What is Pearl Turner Harvey's date of birth?" page
    When I fill in the "dateOfBirth.day" field with "2"
    And I fill in the "dateOfBirth.month" field with "12"
    And I fill in the "dateOfBirth.year" field with "1939"
    And I click the "Continue" button
    Then I should be on the "Check Pearl Turner Harvey's details" page
    And I should see the following values on the page
      | value            |
      | Pearl                |
      | Turner Harvey    |
      | 02 December 1939 |
      | QQ 12 34 56 C    |
      | PSA12345678A     |

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: Happy Path Journey - Navigate to Check Your Answers page and Change the 'NINO/TRN'.
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
    And I fill in the "psaCheckRef" field with "PSA12345678A"
    And I click the "Continue" button
    Then I should be on the "Check Pearl Turner Harvey's details" page
    When I click on the Change link for "National Insurance number"
    Then I should be on the "What is Pearl Turner Harvey's National Insurance number?" page
    When I fill in the "nino" field with "11a11111"
    And I click the "Continue" button
    Then I should be on the "Check Pearl Turner Harvey's details" page
    And I should see the following values on the page
      | value           |
      | Pearl           |
      | Turner Harvey   |
      | 05 January 1987 |
      | 11 a1 11 11     |
      | PSA12345678A    |

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: Happy Path Journey - Navigate to Check Your Answers page and Change the 'PSA Check Reference number'.
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
    And I fill in the "psaCheckRef" field with "PSA12345678A"
    And I click the "Continue" button
    Then I should be on the "Check Pearl Turner Harvey's details" page
    When I click on the Change link for "Pension scheme administrator check reference"
    Then I should be on the "What is Pearl Turner Harvey's pension scheme administrator check reference?" page
    And I fill in the "psaCheckRef" field with "PSA87654321B"
    And I click the "Continue" button
    Then I should be on the "Check Pearl Turner Harvey's details" page
    And I should see the following values on the page
      | value           |
      | Pearl           |
      | Turner Harvey   |
      | 05 January 1987 |
      | QQ 12 34 56 C   |
      | PSA87654321B    |

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: Happy Path Journey - Navigate to 'Check Your Answer' Page and click on 'Back' button
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
    And I fill in the "psaCheckRef" field with "PSA12345678A"
    And I click the "Continue" button
    Then I should be on the "Check Pearl Turner Harvey's details" page
    When I click the "Back" link
    Then I should be on the "What is Pearl Turner Harvey's pension scheme administrator check reference?" page

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |
