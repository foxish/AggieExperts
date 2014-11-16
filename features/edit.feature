Feature: Editing Profiles
  As a user,
  So that I can edit information on my profile,
  I want to view and edit information on my profile page

  Scenario: Edit link works as expected
    Given I am on the edit page
    Then I should see "Home"
    And I should see "Contact Us"
    And I should see "John"
    And I should see "Samuel"
    And I should see "Phone: 9790002233"
    And I should see " Email: samuel@tamu.edu"
    And I should see "Bio Y"
    And I should see "Publications"
    And I should see "Title URL Delete"
    And I should see "bar_title http://www.bar.com"
    And I should see "foo_title http://www.foo.com"
    And I should see "baz_title http://www.baz.com"
    And I should see "Keywords Key Delete"
    And I should see "foo"
    And I should see the image "default.png"

  Scenario: Clicking on Save should take me back to profile page
    Given I am on the edit page
    When I press "Save"
    Then I am on the profile page

  Scenario: Editing fname saves as expected
    Given I am on the edit page
    When I fill in "fname" with "foo"
    When I press "Save"
    Then I am on the profile page
    And I should see "foo Samuel"

  Scenario: Editing lname saves as expected
    Given I am on the edit page
    When I fill in "lname" with "bar"
    When I press "Save"
    Then I am on the profile page
    And I should see "John bar"

  Scenario: Editing bio saves as expected
    Given I am on the edit page
    When I fill in "bio" with "foobar"
    When I press "Save"
    Then I am on the profile page
    And I should see "Bio foobar"

  Scenario: Editing phone number saves as expected
    Given I am on the edit page
    When I fill in "phone" with "1234567890"
    When I press "Save"
    Then I am on the profile page
    And I should see "Phone: 1234567890"

  Scenario: Editing email saves as expected
    Given I am on the edit page
    When I fill in "email" with "foobar@email.id"
    When I press "Save"
    Then I am on the profile page
    And I should see "Email: foobar@email.id"

  Scenario: Editing publication title saves as expected
    Given I am on the edit page
    When I fill in "pub[1][data][title]" with "fooTitle"
    When I press "Save"
    Then I am on the profile page
    And I should see "fooTitle"

  Scenario: Editing publication url saves as expected
    Given I am on the edit page
    When I fill in "pub[1][data][title]" with "fooURL"
    When I press "Save"
    Then I am on the profile page
    And I should see "fooURL"

  Scenario: Checking publication delete deletes as expected
    Given I am on the edit page
    When I check "pub[1][check]"
    When I press "Save"
    Then I am on the profile page
    And I should not see "foo_title"

  Scenario: Do edits for all fields, check if saves happens
    Given I am on the edit page
    When I fill in "fname" with "foo"
    When I fill in "lname" with "bar"
    When I fill in "bio" with "foobar"
    When I fill in "phone" with "1234567890"
    When I fill in "email" with "foobar@email.id"
    When I fill in "pub[1][data][title]" with "fooTitle"
    When I fill in "pub[1][data][url]" with "fooURL"
    When I check "pub[2][check]"
    When I press "Save"
    Then I am on the profile page
    And I should see "foo"
    And I should see "bar"
    And I should see "Bio foobar"
    And I should see "Phone: 1234567890"
    And I should see "Email: foobar@email.id"
    And I should see "fooTitle"
    And I should not see "bar_title"


