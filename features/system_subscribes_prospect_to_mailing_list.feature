Feature: system subscribes prospect to mailing list

  In order to increase revenue
  A marketer
  Wants to follow up and build relationship with his prospects ON AUTOPILOT
  So that he can free more time to do the money-making activities

  Scenario: user was subscribed successfully
    Given I am on the opt-in page
    When I opt-in with "Some Firstname" and "some@email.com"
    And I go to the subscribers page
    Then I should see "Some Firstname" and "some@email.com"