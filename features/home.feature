Feature: Homepage should be accessible
As a user,
So that I can search and login,
I want to arrive on the AggieExperts homepage

Scenario: content on homepage
  Given I am on the home page
  Then I should see "Home"
  And I should see "Contact Us"
  
Scenario: Home link in the header
  Given I am on the home page
  When I click first link of type ".home"
  Then I should be on the home page  

Scenario: Search field and button
  Given I am on the home page
  When I fill in "tb_search" with "test" 
  Then I press "bt_search"
  Then I should be on the search page

Scenario: Search field and button
  Given I am on the home page
  When I fill in "tb_search" with " " 
  Then I press "bt_search"
  Then I should be on the search page
  
Scenario: Search field and button
  Given I am on the home page
  When I fill in "tb_search" with "Charles Modern" 
  Then I press "bt_search"
  Then I should be on the search page  

Scenario: request invite
  Given I am on the request_invite page
  Then I should see "Name"
  And I should see "Email"
  And I should see "Department"
  And I should see "Message"

Scenario: request invite
  Given I am on the request_invite page
  And I fill in "Name" with "John Doe"
  And I fill in "Email" with "email@rmail.com"
  And I fill in "Department" with "Computer Science"
  And I fill in "Message" with "test"
  And I press "Request Invite"
  Then I should be on the home page
  And I should see "Thank you. An email will be sent to you once your request is approved"

