@regression
Feature:As a PSA/PSP
I want to login and navigate to Homepage.


  Scenario: Login with a valid PSA User ID and navigate to Homepage
    Given I have a new session
    And I fill in the auth details for enrolment PSA with value A2100001
    Then I should be on the "Check a member's protections and enhancements" page

  Scenario: Login with a valid PSP User ID and navigate to Homepage
    Given I have a new session
    And I fill in the auth details for enrolment PSP with value 21000002
    Then I should be on the "Check a member's protections and enhancements" page

  Scenario: Login with invalid PSA/PSP User ID and navigate to Government Gateway page
    Given I have a new session
    And I fill in the auth details for enrolment PWP with value A2100001
    Then I should be on the "Authority Wizard" page


