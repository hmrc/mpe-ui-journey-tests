@acceptance @regression
Feature:As a PSA/PSP
  I want to login and navigate to MPE Dashboard page

  Scenario: Enter member details and navigate to MPE Results page for PSA
    Given I have a new session
    And I fill in the auth details for enrolment PSA with value A2100001
    Then I should be on the "members-protections-and-enhancements" page
