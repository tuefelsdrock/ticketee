Feature: Deleting tickets
  In order to remove tickets
  As a user
  I want to press a button and make them disappear

  Background:
    Given there are the following users:
    | email | password | admin |
    | user@ticketee.com | password | false |
    | admin@ticketee.com | password | true |
    Given there is a project called "TextMate 2"
    And "user@ticketee.com" has created a ticket for this project:
    | title | description |
    | Make it shiny! | Gradients! Starbursts! Oh my! |


Scenario: Delete ticket link is shown to a user with permission
Given "user@ticketee.com" can view the "TextMate 2" project
And "user@ticketee.com" can delete tickets in the "TextMate 2" project
And I am signed in as "user@ticketee.com"
    Given I am on the homepage
    When I follow "TextMate 2"
    And I follow "Make it shiny!"
Then I should see "Delete"
Scenario: Delete ticket link is hidden from a user without permission
Given "user@ticketee.com" can view the "TextMate 2" project
And I am signed in as "user@ticketee.com"
    Given I am on the homepage
    When I follow "TextMate 2"
    And I follow "Make it shiny!"
Then I should not see the "Delete" link
Scenario: Delete ticket link is shown to admins
Given I am signed in as "admin@ticketee.com"
    Given I am on the homepage
    When I follow "TextMate 2"
    And I follow "Make it shiny!"
Then I should see the "Delete" link

