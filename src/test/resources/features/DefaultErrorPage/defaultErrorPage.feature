@e2e
Feature:As a PSA/PSP User
  I want to login and navigate to Default Error Page

  Scenario Outline: Happy Path Journey - Navigate to Default Error page when there is issue within the service or when an API response error code is recieved
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "Check a pension scheme member's protections and enhancements" page
    When I click the "Start now" link
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
    When I fill in the "nino" field with "ER400400A"
    And I click the "Continue" button
    Then I should be on the "What is the member's pension scheme administrator check reference?" page
    And I fill in the "psaCheckRef" field with "PSA21436587W"
    And I click the "Continue" button
    Then I should be on the "Check your answers" page
    When I click the "Submit" button
    Then I should be on the "Sorry, there is a problem with the service" page
   And I should see the "contact us for help with pension scheme queries" link on the page

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
