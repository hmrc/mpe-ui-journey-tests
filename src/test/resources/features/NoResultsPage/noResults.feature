@e2e
Feature:As a PSA/PSP User
  I want to login and navigate to No Results Page

  Scenario Outline: Happy Path Journey - Navigate to No Results page when details entered within the Lifetime Protections and Enhancements service do not match an existing protection certificate.
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "Check a pension scheme member's protections and enhancements" page
    When I click the "Start now" link
    Then I should be on the "What is the member's name?" page
    When I fill in the "firstName" field with "MFIRSTNAMEe"
    And I fill in the "lastName" field with "SLASTNAMEr"
    And I click the "Continue" button
    Then I should be on the "What is the member's date of birth?" page
    When I fill in the "dateOfBirth.day" field with "15"
    And I fill in the "dateOfBirth.month" field with "7"
    And I fill in the "dateOfBirth.year" field with "1942"
    And I click the "Continue" button
    Then I should be on the "What is the member's National Insurance number?" page
    When I fill in the nino "nino" field with "EC1"
    And I click the "Continue" button
    Then I should be on the "What is the member's pension scheme administrator check reference?" page
    And I fill in the psaCheckRef "psaCheckRef" field with "PSA567"
    And I click the "Continue" button
    Then I should be on the "Check your answers" page
    When I click the "Submit" button
    Then I should be on the "The details you entered did not match an existing protection certificate" page
    And I should see the "try again" link on the page
   When I click the "try again" link
   Then I should be on the "Check your answers" page

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
