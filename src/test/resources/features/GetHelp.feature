@regression_qa @acceptance @a11y
Feature: As a PSA
  I want to be able to select the get help link on the relevant pages
  So that I can validate the integration of DeskPro

  Scenario: 107 Get Help link for leaving the pension scheme
    Given I have a new session
    And   I fill in the auth details for enrolment PSA with value B1234568
    Then  I should be on the "Guaranteed Minimum Pension (GMP) checker" page
    When  I click the "Single calculation" link
    Then  I should be on the "Enter Scheme Contracted Out Number (SCON)" page
    When  I fill in the "scon" field with "S4003267F"
    And   I should see the "Is this page not working properly? (opens in new tab)" link on the page
    And   I click the "Continue" button
    Then  I should be on the "Enter member’s details" page
    And   I should see the "Is this page not working properly? (opens in new tab)" link on the page
    When  I fill in the "nino" field with "AA000004A"
    And   I fill in the "firstForename" field with "MARCUS"
    And   I fill in the "surname" field with "BILLING"
    And   I click the "Continue" button
    Then  I should be on the "What type of calculation do you need?" page
    And   I should see the "Is this page not working properly? (opens in new tab)" link on the page
    When  I select the "Leaving" radio button on the "What type of calculation do you need?" page
    And   I click the "Continue" button
    Then  I should be on the "Did the member leave the scheme before 6 April 2016?" page
    And   I should see the "Is this page not working properly? (opens in new tab)" link on the page
    When  I select the "Yes" radio button on the "Did the member leave the scheme before 6 April 2016?" page
    And   I click the "Continue" button
    Then  I should be on the "Do you also want an opposite gender calculation?" page
    And   I should see the "Is this page not working properly? (opens in new tab)" link on the page
    When  I select the "No" radio button on the "Do you also want an opposite gender calculation?" page
    And   I click the "Continue" button
    Then  I should be on a GMP checker error page
    And   I should see the "Is this page not working properly? (opens in new tab)" link on the page

  Scenario: 108 Check accessibility statement on the GMP page
    Given I have a new session
    And   I fill in the auth details for enrolment PSA with value B1234568
    Then  I should be on the "Guaranteed Minimum Pension (GMP) checker" page
    When  I click the "Accessibility statement" link
    Then   I should see "Accessibility statement for Guaranteed Minimum Pension service" on the page