Feature: Viewing Profiles
  As a website visitor,
  So that I can view more information about faculty,
  I want to view his/her AggieExperts profile page

  Scenario: content on profilepage
    Given I am on the profile page
    Then I should see "Home"
    And I should see "Contact Us"
    And I should see the image "default.png"
    And I should see "Phone: 9790002233"
    And I should see "Email: samuel@tamu.edu"
    And I should see "Publications"
    And I should see "bar_title"
    And I should see "foo_title"
    And I should see "baz_title"
    And I should see "Keywords foo"
    And I should see "Bio Y"
    And I should see "John Samuel"
    And I should see "Edit info"

  Scenario: Clicking on Edit should take me to edit profile
    Given I am on the profile page
    When I follow "Edit info"
    Then I should be on the edit page