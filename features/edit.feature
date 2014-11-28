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
    And I should see "Keywords Try to re-use existing keywords Key"
    And I should see "foo"
    And I should see the image "default.png"

  Scenario: Clicking on Save should take me back to profile page
    Given I am on the edit page
    When I press "Save"
    Then I am on the profile page

  Scenario: Editing name saves as expected
    Given I am on the edit page
    When I fill in "id_name" with "foo"
    When I press "Save"
    Then I am on the profile page
    And I should see "foo"

  Scenario: Editing bio saves as expected
    Given I am on the edit page
    When I fill in "id_bio" with "foobar"
    When I press "Save"
    Then I am on the profile page
    And I should see "Bio foobar"

  Scenario: Editing phone number saves as expected
    Given I am on the edit page
    When I fill in "id_phone" with "1234567890"
    When I press "Save"
    Then I am on the profile page
    And I should see "Phone: (123) 456-7890"

  Scenario: Editing email saves as expected
    Given I am on the edit page
    When I fill in "id_email" with "foobar@email.id"
    When I press "Save"
    Then I am on the profile page
    And I should see "Email: foobar@email.id"

  Scenario: Editing publication title saves as expected
    Given I am on the edit page
    When I fill in "pub_title_1" with "fooTitle"
    When I press "Save"
    Then I am on the profile page
    And I should see "fooTitle"

  Scenario: Checking publication delete deletes as expected
    Given I am on the edit page
    When I check "pub[1][check]"
    When I press "Save"
    Then I am on the profile page
    And I should not see "foo_title"

  Scenario: Do edits for all fields, check if saves happens
    Given I am on the edit page
    When I fill in "id_name" with "foo"
    When I fill in "id_bio" with "foobar"
    When I fill in "id_phone" with "1234567890"
    When I fill in "id_email" with "foobar@email.id"
    When I fill in "pub_title_1" with "fooTitle"
    When I fill in "pub_url_1" with "fooURL"
    When I check "pub_check_2"
    When I press "Save"
    Then I am on the profile page
    And I should see "foo"
    And I should see "Bio foobar"
    And I should see "Phone: (123) 456-7890"
    And I should see "Email: foobar@email.id"
    And I should see "fooTitle"
    And I should not see "bar_title"

  Scenario: Editing Keywords 1 saves as expected
    Given I am on the edit page
    When I fill in "key_word_0" with "fooKeyword"
    When I press "Save"
    Then I am on the profile page
    And I should see "Foo; Fookeyword;"

  Scenario: Editing Keywords 2 saves as expected
    Given I am on the edit page
    When I fill in "key_word_1" with "fooKeyword"
    When I press "Save"
    Then I am on the profile page
    And I should see "Bar; Fookeyword;"

  Scenario: Adding 1 new Keyword saves as expected
    Given I am on the edit page
    When I fill in "key_word_2" with "fooKeyword_2"
    When I press "Save"
    Then I am on the profile page
    And I should see "Bar; Foo; Fookeyword_2;"

  Scenario: Adding 2 new Keywords saves as expected
    Given I am on the edit page
    When I fill in "key_word_2" with "fooKeyword_2"
    When I fill in "key_word_3" with "fooKeyword_3"
    When I press "Save"
    Then I am on the profile page
    And I should see "Bar; Foo; Fookeyword_2; Fookeyword_3;"

  Scenario: Adding 3 new Keywords saves as expected
    Given I am on the edit page
    When I fill in "key_word_2" with "fooKeyword_2"
    When I fill in "key_word_3" with "fooKeyword_3"
    When I fill in "key_word_4" with "fooKeyword_4"
    When I press "Save"
    Then I am on the profile page
    And I should see "Bar; Foo; Fookeyword_2; Fookeyword_3; Fookeyword_4;"

  Scenario: Adding 4 new Keywords saves as expected
    Given I am on the edit page
    When I fill in "key_word_2" with "fooKeyword_2"
    When I fill in "key_word_3" with "fooKeyword_3"
    When I fill in "key_word_4" with "fooKeyword_4"
    When I fill in "key_word_5" with "fooKeyword_5"
    When I press "Save"
    Then I am on the profile page
    And I should see "Bar; Foo; Fookeyword_2; Fookeyword_3; Fookeyword_4; Fookeyword_5;"



