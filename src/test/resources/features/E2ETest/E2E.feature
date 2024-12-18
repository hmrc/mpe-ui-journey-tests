@regression @accessibility @e2e
Feature:As a PSA/PSP
  I want to view data, submit returns and file report for pension schemes.

  Scenario: Enter member details and navigate to MPE Results page
    Given I have a new session
    And I fill in the auth details for enrolment PSA with value A2100001
    Then  I should be on the "Members Protection Enhancement (MPE) checker" page
    And I click the "Start Journey" button
    Then  I should be on the "Pension Scheme Administrator or Practicioner" page
    And I click the "Administrator View" button
    Then I should be on the "MPE Start" page
    And I click the "Continue" button
    Then I should be on the "Enter member’s details" page
    And I fill in the "firstname" field with "Pearl"
    And I fill in the "surname" field with "Turner Harvey"
    Then I should be on the "date of birth" page
    And   I fill in the "leavingDate-leavingDate.day" field with "07"
    And   I fill in the "leavingDate-leavingDate.month" field with "07"
    And   I fill in the "leavingDate-leavingDate.year" field with "2016"
    Then I should be on the "nino" page
    And  I fill in the "nino" field with "NB315648A"
    Then I should be on the "pension scheme administrator check reference" page
    And I fill in the "PSA Check Reference" field with "PSA12345678A"
    Then I should be on the "Check Your Answers" page
    And   I click the "Accept and submit" button

  Scenario: Check accessibility statement on the GMP page
    Given I have a new session
    And I fill in the auth details for enrolment PSA with value A2100001
    Then I should be on the "Members Protection Enhancement checker" page
    When I click the "Accessibility statement" link
    Then I should see "Accessibility statement for Members Protection Enhancement checker service" on the page