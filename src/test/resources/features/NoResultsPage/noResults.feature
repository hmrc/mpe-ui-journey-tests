@e2e
Feature:As a PSA/PSP User
  I want to login and navigate to No Results Page

  Scenario Outline: Happy Path Journey - Navigate to No Results page when details entered within the Lifetime Protections and Enhancements service do not match an existing protection certificate.
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "What you'll need" page
    When I click the "Continue" link
    Then I should be on the "What is the member's name?" page
    When I fill in the "firstName" field with "Emily"
    And I fill in the "lastName" field with "Carter"
    And I click the "Continue" button
    Then I should be on the "What is the member's date of birth?" page
    When I fill in the "dateOfBirth.day" field with "18"
    And I fill in the "dateOfBirth.month" field with "7"
    And I fill in the "dateOfBirth.year" field with "1969"
    And I click the "Continue" button
    Then I should be on the "What is the member's National Insurance number?" page
    When I fill in the "nino" field with "EC130589A"
    And I click the "Continue" button
    Then I should be on the "What is the member's pension scheme administrator check reference?" page
    And I fill in the "psaCheckRef" field with "PSA21436587W"
    And I click the "Continue" button
    Then I should be on the "Check your answers" page
    When I click the "Submit" link
    Then I should be on the "Your search didn't return any results" page
    And I should see the following values on the page
      | value             |
      | Emily Carter      |
      | 18 July 1969      |
      | EC 13 05 89 A     |
      | PSA 21 43 65 87 W |
   And I should see the "try again" link on the page
   When I click the "try again" link
   Then I should be on the "Check your answers" page

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |

  Scenario Outline: Happy Path Journey - Navigate to No Results page when the member details match but he does not have any exiting Protection certificate
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "What you'll need" page
    When I click the "Continue" link
    Then I should be on the "What is the member's name?" page
    When I fill in the "firstName" field with "Olivia"
    And I fill in the "lastName" field with "Thompson"
    And I click the "Continue" button
    Then I should be on the "What is the member's date of birth?" page
    When I fill in the "dateOfBirth.day" field with "18"
    And I fill in the "dateOfBirth.month" field with "12"
    And I fill in the "dateOfBirth.year" field with "1983"
    And I click the "Continue" button
    Then I should be on the "What is the member's National Insurance number?" page
    When I fill in the "nino" field with "OT890513A"
    And I click the "Continue" button
    Then I should be on the "What is the member's pension scheme administrator check reference?" page
    And I fill in the "psaCheckRef" field with "PSA87654321W"
    And I click the "Continue" button
    Then I should be on the "Check your answers" page
    When I click the "Submit" link
    Then I should be on the "Your search didn't return any results" page
    And I should see the following values on the page
      | value             |
      | Olivia Thompson   |
      | 18 December 1983  |
      | OT 89 05 13 A     |
      | PSA 87 65 43 21 W |

    Examples:
      | enrolmentID | enrolmentValue |
      | PSP         | 21000002       |
