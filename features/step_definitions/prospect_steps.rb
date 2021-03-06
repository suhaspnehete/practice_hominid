When /^I opt\-in with "([^"]*)" and "([^"]*)"$/ do |firstname, email|
  steps %Q{
    When I fill in "Firstname" with "#{firstname}"
    And I fill in "Email" with "#{email}"
    And I press "Submit"
  }
end

Then /^I should see "([^"]*)" and "([^"]*)"$/ do |firstname, email|
  steps %Q{
    Then I should see "#{firstname}"
    And I should see "#{email}"
  }
end

Then /^I should be redirected$/ do
  follow_redirect!
end
