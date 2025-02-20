@acceptance @regression
Feature:As a PSA/PSP
  I want to login and navigate to Start Page

  Scenario: Login with a valid PSA User ID and navigate to Homepage
    Given I have a new session
    And I fill in the auth details for enrolment PSA with value A2100001
    Then I should be on the "Check a member's protections and enhancements" page
    And I should see the following values on the page
      | value                                        |
      | full name                                    |
      | date of birth                                |
      | National Insurance number                    |
      | pension scheme administrator check reference |
    And I should see the "Start now" link on the page
    When I click the "Start now" link
    Then I should be on the "What is the member's name?" page

  Scenario: Login with a valid PSP User ID and navigate to Homepage
    Given I have a new session
    And I fill in the auth details for enrolment PSP with value 21000002
    Then I should be on the "Check a member's protections and enhancements" page
    And I should see the following values on the page
      | value                                        |
      | full name                                    |
      | date of birth                                |
      | National Insurance number                    |
      | pension scheme administrator check reference |
    And I should see the "Start now" link on the page
    When I click the "Start now" link
    Then I should be on the "What is the member's name?" page

