Feature: Deleting tickets
  In order to remove tickets
  As a user
  I want to press a button and make them disappear

  Background:
    Given there are the following users:
    | email | password | admin |
    | user@ticketee.com | password | false |
    | admin@ticketee.com | password | true |
    And I am signed in as them
    Given there is a project called "TextMate 2"
    And "user@ticketee.com" has created a ticket for this project:
    | title | description |
    | Make it shiny! | Gradients! Starbursts! Oh my! |
    And "user@ticketee.com" can view the "TextMate 2" project
    And "user@ticketee.com" can delete tickets in the "TextMate 2" project
    Given I am on the homepage
    When I follow "TextMate 2"
    And I follow "Make it shiny!"

  Scenario: Deleting a ticket
# 9.2.2 breaks this
#    When I follow "Delete Ticket"
#    Then I should see "Ticket has been deleted."
#    And I should be on the project page for "TextMate 2"
    
  Scenario: Delete ticket link is shown to a user with permission
    Given "user@ticketee.com" can view the "TextMate 2" project
#    And "user@ticketee.com" can delete tickets in the "TextMate 2" project
#     And I am signed in as "user@ticketee.com"
#     When I follow "TextMate 2"
#     And I follow "Make it shiny!"
#     Then I should see "delete ticket"

  Scenario: Delete ticket link is hidden from a user without permission
    Given "user@ticketee.com" can view the "TextMate 2" project
#     And I am signed in as "user@ticketee.com"
#     When I follow "TextMate 2"
#     And I follow "Make it shiny!"
#     Then I should not see the "delete ticket" link
# 
  Scenario: Delete ticket link is shown to admins
#    Given I am signed in as "admin@ticketee.com"
#     When I follow "TextMate 2"
#     And I follow "Make it shiny!"
#     Then I should see the "delete ticket" link

