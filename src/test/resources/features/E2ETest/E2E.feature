@regression @accessibility @e2e
Feature:As a PSA/PSP
  I want to login and navigate to Results Page and view the Protection and Enhancements

  Scenario: Enter member details and navigate to MPE Results page
    Given I have a new session
    And I fill in the auth details for enrolment PSA with value A2100001
    Then I should be on the "members-protections-and-enhancements" page
    And I click the "Start Journey" button
    Then  I should be on the "Pension Scheme Administrator or Practitioner" page
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
    When I click the "Submit" link

  Scenario Outline: TC01 - Happy Path Journey - Open enhanced Protection - Valid Member Look up
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "Check a member's protections and enhancements" page
    When I click the "Start now" link
    Then I should be on the "What is the member's name?" page
    When I fill in the "firstName" field with "John"
    And I fill in the "lastName" field with "Smith"
    And I click the "Continue" button
    Then I should be on the "What is John Smith's date of birth?" page
    When I fill in the "dateOfBirth.day" field with "10"
    And I fill in the "dateOfBirth.month" field with "9"
    And I fill in the "dateOfBirth.year" field with "1954"
    And I click the "Continue" button
    Then I should be on the "What is John Smith's National Insurance number?" page
    When I fill in the "nino" field with "JX 99 99 99 A"
    And I click the "Continue" button
    Then I should be on the "What is John Smith's pension scheme administrator check reference?" page
    And I fill in the "psaCheckRef" field with "PSA 12 34 56 78 W"
    And I click the "Continue" button
    Then I should be on the "Check John Smith's details" page
    When I click the "Accept and submit" link
    Then I should be on the "Results of your protections and enhancements check" page
    And I should see the following values on the page
      | value             |
      | John Smith        |
      | 10 September 1954 |
      | JX 99 99 99 A     |
      | PSA 12 34 56 78 W |
    And I should see the following links on the page
      | links                                               |
      | MPS dashboard                                       |
      | Check another member's protections and enhancements |
      | More information on pension protections             |
      | Print this page                                     |
    And The Checked On time stamp should display current date and time
    And The "Protection" tables contain:
      | Type                   | Status | Protected amount | Lump sum | Factor | Protection reference number |
      | Enhancement Protection | Open   |                  |          | 12     | 1234567A                    |

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: TC02 - Happy Path Journey - Open enhanced Protection and dormant primary protection - Valid Member look up
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "Check a member's protections and enhancements" page
    When I click the "Start now" link
    Then I should be on the "What is the member's name?" page
    When I fill in the "firstName" field with "Alan"
    And I fill in the "lastName" field with "Williams"
    And I click the "Continue" button
    Then I should be on the "What is Alan Williams's date of birth?" page
    When I fill in the "dateOfBirth.day" field with "27"
    And I fill in the "dateOfBirth.month" field with "2"
    And I fill in the "dateOfBirth.year" field with "1949"
    And I click the "Continue" button
    Then I should be on the "What is Alan Williams's National Insurance number?" page
    When I fill in the "nino" field with "SB 99 99 99 A"
    And I click the "Continue" button
    Then I should be on the "What is Alan Williams's pension scheme administrator check reference?" page
    And I fill in the "psaCheckRef" field with "PSA 23 45 67 81 W"
    And I click the "Continue" button
    Then I should be on the "Check Alan Williams's details" page
    When I click the "Accept and submit" link
    Then I should be on the "Results of your protections and enhancements check" page
    And I should see the following values on the page
      | value             |
      | Alan Williams     |
      | 24 February 1949  |
      | SB 99 99 99 A     |
      | PSA 23 45 67 81 W |
    And I should see the following links on the page
      | links                                               |
      | MPS dashboard                                       |
      | Check another member's protections and enhancements |
      | More information on pension protections             |
      | Print this page                                     |
    And The Checked On time stamp should display current date and time
    And The "Protection" tables contain:
      | Type                   | Status  | Protected amount | Lump sum | Factor | Protection reference number |
      | Enhancement Protection | Open    |                  |          | 12     | EPRO2345678901A             |
      | Primary Protection     | Dormant |                  | 234,876  | 0.54   | 1234567A                    |

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: TC03 - Happy Path Journey - Individual has open individual protection 2014, dormant fixed protection 2016 and withdrawn primary protection - Valid Member look up
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "Check a member's protections and enhancements" page
    When I click the "Start now" link
    Then I should be on the "What is the member's name?" page
    When I fill in the "firstName" field with "Rose"
    And I fill in the "lastName" field with "Rooster"
    And I click the "Continue" button
    Then I should be on the "What is Rose Rooster's date of birth?" page
    When I fill in the "dateOfBirth.day" field with "30"
    And I fill in the "dateOfBirth.month" field with "1"
    And I fill in the "dateOfBirth.year" field with "1939"
    And I click the "Continue" button
    Then I should be on the "What is Rose Rooster's National Insurance number?" page
    When I fill in the "nino" field with "LW 99 99 99 C"
    And I click the "Continue" button
    Then I should be on the "What is Rose Rooster's pension scheme administrator check reference?" page
    And I fill in the "psaCheckRef" field with "PSA 34 56 78 12 W"
    And I click the "Continue" button
    Then I should be on the "Check Rose Rooster's details" page
    When I click the "Accept and submit" link
    Then I should be on the "Results of your protections and enhancements check" page
    And I should see the following values on the page
      | value             |
      | Rose Rooster      |
      | 20 January 1939   |
      | LW 99 99 99 C     |
      | PSA 34 56 78 12 W |
    And I should see the following links on the page
      | links                                               |
      | MPS dashboard                                       |
      | Check another member's protections and enhancements |
      | More information on pension protections             |
      | Print this page                                     |
    And The Checked On time stamp should display current date and time
    And The "Protection" tables contain:
      | Type                  | Status    | Protected amount | Lump sum | Factor | Protection reference number |
      | Individual Protection | Open      | 1,500,000        |          |        | IP141234567890A             |
      | Fixed Protection 2016 | Dormant   |                  |          |        | FP161234567890A             |
      | Primary Protection    | Withdrawn |                  | 34,876   | 0.21   | PPRO2345678901A             |

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: TC04 - Happy Path Journey - Individual has open individual protection 2016, withdrawn fixed protection 2016 and withdrawn individual protection 2014 - Valid Member look up
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "Check a member's protections and enhancements" page
    When I click the "Start now" link
    Then I should be on the "What is the member's name?" page
    When I fill in the "firstName" field with "Peter"
    And I fill in the "lastName" field with "Parker"
    And I click the "Continue" button
    Then I should be on the "What is Peter Parker's date of birth?" page
    When I fill in the "dateOfBirth.day" field with "18"
    And I fill in the "dateOfBirth.month" field with "5"
    And I fill in the "dateOfBirth.year" field with "1952"
    And I click the "Continue" button
    Then I should be on the "What is Peter Parker's National Insurance number?" page
    When I fill in the "nino" field with "OG 99 99 99 B"
    And I click the "Continue" button
    Then I should be on the "What is Peter Parker's pension scheme administrator check reference?" page
    And I fill in the "psaCheckRef" field with "PSA 45 67 81 23 W"
    And I click the "Continue" button
    Then I should be on the "Check Peter Parker's details" page
    When I click the "Accept and submit" link
    Then I should be on the "Results of your protections and enhancements check" page
    And I should see the following values on the page
      | value             |
      | Peter Parker      |
      | 18 May 1952       |
      | OG 99 99 99 B     |
      | PSA 45 67 81 23 W |
    And I should see the following links on the page
      | links                                               |
      | MPS dashboard                                       |
      | Check another member's protections and enhancements |
      | More information on pension protections             |
      | Print this page                                     |
    And The Checked On time stamp should display current date and time
    And The "Protection" tables contain:
      | Type                       | Status    | Protected amount | Lump sum  | Factor | Protection reference number |
      | Individual Protection 2016 | Open      | 1,213,000        |           |        | IP161234567890A             |
      | Fixed Protection 2016      | Withdrawn |                  |           |        | FP162345678901A             |
      | Individual Protection 2014 | Withdrawn |                  | 1,440,321 |        |                             |

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: TC05 - Happy Path Journey - Individual has open enhanced protection and an International enhancement (transfer from a recognised overseas pension scheme) - Valid Member look up
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "Check a member's protections and enhancements" page
    When I click the "Start now" link
    Then I should be on the "What is the member's name?" page
    When I fill in the "firstName" field with "Tim"
    And I fill in the "lastName" field with "Thomas"
    And I click the "Continue" button
    Then I should be on the "What is Tim Thomas's date of birth?" page
    When I fill in the "dateOfBirth.day" field with "29"
    And I fill in the "dateOfBirth.month" field with "11"
    And I fill in the "dateOfBirth.year" field with "1963"
    And I click the "Continue" button
    Then I should be on the "What is Tim Thomas's National Insurance number?" page
    When I fill in the "nino" field with "ZA 99 99 99 A"
    And I click the "Continue" button
    Then I should be on the "What is Tim Thomas's pension scheme administrator check reference?" page
    And I fill in the "psaCheckRef" field with "PSA 56 78 12 34 W"
    And I click the "Continue" button
    Then I should be on the "Check Tim Thomas's details" page
    When I click the "Accept and submit" link
    Then I should be on the "Results of your protections and enhancements check" page
    And I should see the following values on the page
      | value             |
      | Tim Thomas        |
      | 29 November 1963  |
      | ZA 99 99 99 A     |
      | PSA 56 78 12 34 W |
    And I should see the following links on the page
      | links                                               |
      | MPS dashboard                                       |
      | Check another member's protections and enhancements |
      | More information on pension protections             |
      | Print this page                                     |
    And The Checked On time stamp should display current date and time
    And The "Protection" tables contain:
      | Type                | Status | Protected amount | Lump sum | Factor | Protection reference number |
      | Enhanced Protection | Open   |                  | 28       |        | EPRO3456789012A             |
    And The "Enhancement" tables contain:
      | Type                                                                           | Status | Protected amount | Lump sum | Enhancement factor | Protection reference number |
      | International Enhancement (transfer from a recognised overseas pension scheme) | Open   |                  |          | 0.75               | IE242345678901A             |

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: TC06 - Happy Path Journey - Individual has open fixed protection 2016, dormant individual protection 2016, withdrawn primary protection, International enhancement (transfer from a recognised overseas pension scheme), International enhancemant (individuals who are relevant overseas individuals), pension credits (pre-commencement) and pension credits (from previously crystallised rights) - Valid Member look up
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "Check a member's protections and enhancements" page
    When I click the "Start now" link
    Then I should be on the "What is the member's name?" page
    When I fill in the "firstName" field with "Pearl"
    And I fill in the "lastName" field with "Brown"
    And I click the "Continue" button
    Then I should be on the "What is Pearl Brown's date of birth?" page
    When I fill in the "dateOfBirth.day" field with "2"
    And I fill in the "dateOfBirth.month" field with "12"
    And I fill in the "dateOfBirth.year" field with "1939"
    And I click the "Continue" button
    Then I should be on the "What is Pearl Brown's National Insurance number?" page
    When I fill in the "nino" field with "NW 99 99 99 A"
    And I click the "Continue" button
    Then I should be on the "What is Pearl Brown's pension scheme administrator check reference?" page
    And I fill in the "psaCheckRef" field with "PSA 67 81 23 45 W"
    And I click the "Continue" button
    Then I should be on the "Check Pearl Brown's details" page
    When I click the "Accept and submit" link
    Then I should be on the "Results of your protections and enhancements check" page
    And I should see the following values on the page
      | value             |
      | Pearl Brown       |
      | 2 December 1939   |
      | NW 99 99 99 A     |
      | PSA 67 81 23 45 W |
    And I should see the following links on the page
      | links                                               |
      | MPS dashboard                                       |
      | Check another member's protections and enhancements |
      | More information on pension protections             |
      | Print this page                                     |
    And The Checked On time stamp should display current date and time
    And The "Protection" tables contain:
      | Type                  | Status    | Protected amount | Lump sum | Factor | Protection reference number |
      | Fixed Protection 2016 | Open      |                  |          |        | FP163456789012A             |
      | Individual Protection | Dormant   | 1,249,231        |          |        | FP163456789012A             |
      | Primary Protection    | Withdrawn | 1,249,231        |          | 0.45   | 2345678W                    |
    And The "Enhancement" tables contain:
      | Type                                                                           | Status | Protected amount | Lump sum | Enhancement factor | Protection reference number |
      | International Enhancement (transfer from a recognised overseas pension scheme) | Open   |                  |          | 0.23               | IE243456789012A             |
      | International Enhancement (individuals who are relevant overseas individuals)  | Open   |                  |          | 0.12               | IE211234567890A             |
      | Pension Credit (pre-commencement)                                              | Open   |                  |          | 0.09               | PCRD1234567890A             |
      | PPension Credit (from previously crystallised rights)                          | Open   |                  |          | 0.06               | PCRD2345678901A             |

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: TC07 - Happy Path Journey - Individual has open enhanced protection and dormant primary protection - Valid Member Look up
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "Check a member's protections and enhancements" page
    When I click the "Start now" link
    Then I should be on the "What is the member's name?" page
    When I fill in the "firstName" field with "Alan"
    And I fill in the "lastName" field with "Williams"
    And I click the "Continue" button
    Then I should be on the "What is Alan Williams's date of birth?" page
    When I fill in the "dateOfBirth.day" field with "27"
    And I fill in the "dateOfBirth.month" field with "4"
    And I fill in the "dateOfBirth.year" field with "1949"
    And I click the "Continue" button
    Then I should be on the "What is Alan Williams's National Insurance number?" page
    When I fill in the "nino" field with "66Q03379"
    And I click the "Continue" button
    Then I should be on the "What is Alan Williams's pension scheme administrator check reference?" page
    And I fill in the "psaCheckRef" field with "PSA 23 45 67 81 W"
    And I click the "Continue" button
    Then I should be on the "Check Alan Williams's details" page
    When I click the "Accept and submit" link
    Then I should be on the "Results of your protections and enhancements check" page
    And I should see the following values on the page
      | value             |
      | Alan Williams     |
      | 27 April 1949     |
      | 66Q03379          |
      | PSA 23 45 67 81 W |
    And I should see the following links on the page
      | links                                               |
      | MPS dashboard                                       |
      | Check another member's protections and enhancements |
      | More information on pension protections             |
      | Print this page                                     |
    And The Checked On time stamp should display current date and time
    And The "Protection" tables contain:
      | Type                | Status  | Protected amount | Lump sum | Factor | Protection reference number |
      | Enhanced Protection | Open    |                  | 12       |        | EPRO2345678901A             |
      | Primary Protection  | Dormant |                  | 234,876  | 0.54   |                             |

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario Outline: TC08 - Happy Path Journey - Individual has open individual protection 2014, International enhancemant (individuals who are relevant overseas individuals), pension credits (pre-commencement)  and withdrawn primary protection - Valid Member look up
    Given I have a new session
    When I fill in the auth details for enrolment <enrolmentID> with value <enrolmentValue>
    Then I should be on the "Check a member's protections and enhancements" page
    When I click the "Start now" link
    Then I should be on the "What is the member's name?" page
    When I fill in the "firstName" field with "Mile"
    And I fill in the "lastName" field with "Slatcher"
    And I click the "Continue" button
    Then I should be on the "What is Mile Slatcher's date of birth?" page
    When I fill in the "dateOfBirth.day" field with "15"
    And I fill in the "dateOfBirth.month" field with "7"
    And I fill in the "dateOfBirth.year" field with "1942"
    And I click the "Continue" button
    Then I should be on the "What is Mile Slatcher's National Insurance number?" page
    When I fill in the "nino" field with "SA 99 99 99 B"
    And I click the "Continue" button
    Then I should be on the "What is Mile Slatcher's pension scheme administrator check reference?" page
    And I fill in the "psaCheckRef" field with "PSA 56 78 12 33 W"
    And I click the "Continue" button
    Then I should be on the "Check Mile Slatcher's details" page
    When I click the "Accept and submit" link
    Then I should be on the "Results of your protections and enhancements check" page
    And I should see the following values on the page
      | value             |
      | Mile Slatcher     |
      | 29 November 1963  |
      | SA 99 99 99 B     |
      | PSA 56 78 12 33 W |
    And I should see the following links on the page
      | links                                               |
      | MPS dashboard                                       |
      | Check another member's protections and enhancements |
      | More information on pension protections             |
      | Print this page                                     |
    And The Checked On time stamp should display current date and time
    And The "Protection" tables contain:
      | Type                       | Status    | Protected amount | Lump sum  | Factor | Protection reference number |
      | Fixed Protection           | Open      |                  | 28        |        | FP163456789013A             |
      | Individual Protection 2016 | Dormant   |                  | 1,249,231 |        |                             |
      | Primary Protection         | Withdrawn |                  | 34,876    | 0.21   | PPRO2345678901A             |
    And The "Enhancement" tables contain:
      | Type                                                                          | Status | Protected amount | Lump sum | Enhancement factor | Protection reference number |
      | International Enhancement (individuals who are relevant overseas individuals) | Open   |                  |          | 0.12               | IE211234567890A             |

    Examples:
      | enrolmentID | enrolmentValue |
      | PSA         | A2100001       |
      | PSP         | 21000002       |

  Scenario: Check accessibility statement on the GMP page
    Given I have a new session
    And I fill in the auth details for enrolment PSA with value A2100001
    Then I should be on the "Members Protection Enhancement checker" page
    When I click the "Accessibility statement" link
    Then I should see "Accessibility statement for Members Protection Enhancement checker service" on the page
