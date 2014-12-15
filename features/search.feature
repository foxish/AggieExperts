Feature: Visiting profiles
As a website visitor,
So that I can view more information about faculty,
I want to visit his/her AggieExperts profile page

Scenario: content on searchpage
  Given I am on the search page
  Then I should see "Home"
  And I should see "Contact Us"

Scenario: Search field and button
  Given I am on the search page
  When I fill in "tb_search" with "test" 
  Then I press "bt_search"
  Then I should be on the search page

Scenario: Visiting profile using keyword
  Given I am on the search page
  When I fill in "tb_search" with "foo" 
  Then I press "bt_search"
  When I click first link of type ".div_link"
  Then I should be on the first user's profile page
  
Scenario: Visiting profile using name
  Given I am on the search page
  When I fill in "tb_search" with "Charles" 
  Then I press "bt_search"
  When I click first link of type ".div_link"
  Then I should be on the first user's profile page

Scenario: Visiting profile using description
  Given I am on the search page
  When I fill in "tb_search" with "description" 
  Then I press "bt_search"
  When I click first link of type ".div_link"
  Then I should be on the first user's profile page
