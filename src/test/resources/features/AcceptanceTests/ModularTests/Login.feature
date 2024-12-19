@acceptance @regression @wip
Feature:As a PSA/PSP
I want to login as PSA/PSP and navigate to Dashboard page.

  Scenario: Enter member details and navigate to MPE Results page
    Given I have a new session
    And I fill in the auth details for enrolment PSA with value A2100001
#   ToDO When the URL is updated with proper Title below Step needs to be implemented
    Then I should be on the "members-protections-and-enhancements" page
