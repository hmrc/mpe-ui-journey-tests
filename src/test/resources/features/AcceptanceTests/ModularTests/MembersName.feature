@acceptance @regression
Feature:As a PSA/PSP User
  I want to login and navigate to 'Member name' Page

  Scenario Outline: Happy Path Journey - Navigate to 'Member name' Page and enter valid First and Last Name
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "What you'll need" page
    When I click the "Continue" link
    Then I should be on the "Member name" page
    When I click the "Back" link
    Then I should be on the "What you'll need" page

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: Happy Path Journey - Navigate to 'Member name' Page and click on 'Back' button
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "What you'll need" page
    When I click the "Continue" link
    Then I should be on the "Member name" page
    And I fill in the "firstName" field with "Pearl"
    And I fill in the "lastName" field with "Turner Harvey"
    And I click the "Continue" button
    Then I should be on the "What is the member's date of birth?" page

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: Happy Path Journey - Navigate to 'Member name' Page and click on 'Back' button
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "What you'll need" page
    When I click the "Continue" link
    Then I should be on the "Member name" page
    When I click the "Sign out" link
    Then I should be on the "Give feedback" page

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: Happy Path Journey - Navigate to 'Member's DOB' Page and click on 'Back' button
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "What you'll need" page
    When I click the "Continue" link
    Then I should be on the "Member name" page
    And I fill in the "firstName" field with "Pearl"
    And I fill in the "lastName" field with "Turner Harvey"
    And I click the "Continue" button
    Then I should be on the "What is the member's date of birth?" page
    And I click the "Back" link
    Then I should be on the "Member name" page

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |


  Scenario Outline: Unhappy path journey's for 'Member name' Page for a valid PSA User
    Given I have a new session
    When I fill in the auth details for enrolment PSA with value A2100001
    Then I should be on the "What you'll need" page
    When I click the "Continue" link
    Then I should be on the "Member name" page
    And I fill in the "firstName" field with "<firstName>"
    And I fill in the "lastName" field with "<lastName>"
    And I click the "Continue" button
    Then I should be on the "<page>" page
    Then I should see "<error>" error on the page
    And  The error link should show "<error>"
    And  I click the "<error>" error link

    Examples:
      | firstName                                          | lastName                             | page               | error                                                  |
      | Pearl 123                                          | Turner Harvey 123                    | Error: Member name | Enter the member's last name in a valid format         |
      | Pearl !@£$%^&*()"                                  | Turner Harvey !@£$%^&*()             | Error: Member name | Enter the member's last name in a valid format         |
      |                                                    | Turner Harvey                        | Error: Member name | Enter the member's first name                          |
      | Pearl                                              |                                      | Error: Member name | Enter the member's last name                           |
      | Rhoshandiatellyneshiaunneveshenk Koyaanisquatsiuth | Wiiliams                             | Error: Member name | The member's first name must be 35 characters or fewer |
      | Janice                                             | Keihanaikukauakahihuliheekahaunaelel | Error: Member name | The member's last name must be 35 characters or fewer  |

  Scenario Outline: Unhappy path journey's for 'Member name' Page for a valid PSP User
    Given I have a new session
    When I fill in the auth details for enrolment PSP with value 2100002
    Then I should be on the "What you'll need" page
    When I click the "Continue" link
    Then I should be on the "Member name" page
    And I fill in the "firstName" field with "<firstName>"
    And I fill in the "lastName" field with "<lastName>"
    And I click the "Continue" button
    Then I should be on the "<page>" page
    Then I should see "<error>" error on the page
    And  The error link should show "<error>"
    And  I click the "<error>" error link

    Examples:
      | firstName                                          | lastName                             | page               | error                                                  |
      | Pearl 123                                          | Turner Harvey 123                    | Error: Member name | Enter the member's first name in a valid format        |
      | Pearl !@£$%^&*()"                                  | Turner Harvey !@£$%^&*()             | Error: Member name | Enter the member's last name in a valid format         |
      |                                                    | Turner Harvey                        | Error: Member name | Enter the member's first name                          |
      | Pearl                                              |                                      | Error: Member name | Enter the member's last name                           |
      | Rhoshandiatellyneshiaunneveshenk Koyaanisquatsiuth | Williams                             | Error: Member name | The member's first name must be 35 characters or fewer |
      | Janice                                             | Keihanaikukauakahihuliheekahaunaelel | Error: Member name | The member's last name must be 35 characters or fewer  |
