@acceptance @regression
Feature:As a PSA/PSP User
  I want to login and navigate to 'What You'll Need' Page

  Scenario Outline: Happy Path Journey - Login with a valid PSP User ID and navigate to 'What You'll Need' Page
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "What you'll need" page
    And I should see the following values on the page
      | value                                                                                              |
      | full name                                                                                          |
      | date of birth                                                                                      |
      | National Insurance number                                                                          |
      | pension scheme administrator check reference                                                       |
      | Ask the member for the pension scheme administrator check reference if you do not already have it. |
      | They can find the reference:                                                                       |
      | on their protection certificate or confirmation letter                                             |
      | by contacting HMRC if their protection or enhancement is from before 2014                          |
    And I should see the "check the protected allowances on their pension savings" link on the page
    And I should see the "Continue" link on the page
    When I click the "Continue" link
    Then I should be on the "Member name" page

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: Happy Path Journey - Navigate to 'What You'll Need' Page and click on 'check the protected allowances on their pension savings' link
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "What you'll need" page
    And I should see the "check the protected allowances on their pension savings" link on the page
    When I click the "check the protected allowances on their pension savings" link
    Then I should be on the "Check the protected allowances on your pension savings" page

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: Happy Path Journey - Navigate to 'What You'll Need' Page and click on 'Sign Out' link
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "What you'll need" page
    When I click the "Sign out" link
    Then I should be on the "Give feedback" page

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |


