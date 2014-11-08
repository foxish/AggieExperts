Feature: Admin Page
As an administrator,
So that I can audit users,
I need to be able to view a full list of users, their email addresses and their status

Scenario: navigation from homepage
  Given I am on the home page
  Then I should see "Home"
  And I should see "Contact Us"
  And I should see "Admin Page"
  When I follow "Admin Page"
  Then I should see "Name"
  And I should see "Email"
  And I should see "Action"

Background: Navigation from Home Page
	Given I am on the home page
	Then I should see "Home"
	And I should see "Contact Us"
	And I should see "Admin Page"
	When I follow "Admin Page"
	Then I should see "Name"
	And I should see "Email"
	And I should see "Action"

Scenario: Add new user
	When I fill "Add User" with "abc@xyz.com"
	And I press "Add User"
	Then I should see "abc@xyz.com"

Scenario: filter admin table
	When I select "Pending Approval"
	Then I should see "abc@xyz.com"