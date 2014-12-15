Feature: Admin Page
As an administrator,
So that I can audit users,
I need to be able to view a full list of users, their email addresses and their status

Background: Navigation from Admin main Page
	Given I am on the admin page
	
Scenario: Add new user
	When I fill in "tb_add_user" with "abc@xyz.com"
	And I press "bt_add_user"
	Then I should see "abc@xyz.com"

Scenario: filter admin table
	When I select "ACT" from "Status Filter"
	Then I should see "ACT"

Scenario: admin enable/disable
	When I click first link of type ".img"
	Then I should see the image "/assets/aenable.png"

Scenario: admin delete
	When I click on admin action with image "/assets/adelete.png"
	Then I should not see "Charles Xavier"

Scenario: admin make admin
	When I click on admin action with image "/assets/akey.png"
	Then I should see "ACTIVE"

Scenario: resend email
	When I click on admin action with image "/assets/amail.png"
	Then I should see "AggieExperts Users"