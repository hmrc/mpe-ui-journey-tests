@regression
Feature:As a PSA/PSP User
I want to login and navigate to Homepage.


  Scenario Outline: Happy Path Journey - Login with a valid PSA or PSP User ID and navigate to Homepage
    Given I have a new session
    And I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "What you'll need" page

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario: Unhappy Path Journey - Login with invalid PSA/PSP User ID and navigate to Government Gateway page
    Given I have a new session
    And I fill in the auth details for enrolment PWP with value A2100001
    Then I should be on the "Authority Wizard" page



