Feature: prospect opts in

  In order to increase brand value
  A marketer
  Wants to capture his prospects contact information
  So that he can follow up and build relationship with his prospects

  Scenario: opt in successful
    Given I am on the opt-in page
    When I fill in "Firstname" with "Kenneth"
    And I fill in "Email" with "k@example.com"
    And I press "Submit"
    Then I should be redirected
    And I should see "Please verify your email address."