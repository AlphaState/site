Feature: Signing in and signing out
  In order to manage the content of the website
  As a visitor who has a user account
  I want to sign in

  Background:
    Given there is a user with the following:
      | field    | value         |
      | email    | ivan@home.com |
      | password | secret        |

  Scenario: A visitor signs in and then signs out
    Given I am a visitor
    And I am on the sign-in page
    When I enter the following:
      | field    | value         |
      | Email    | ivan@home.com |
      | Password | secret        |
    And press "Sign in"
    Then I should be on the home page

    When I go to the new page of posts
    Then I should be on the new page of posts

    When I go to the sign-out page
    And I go to the new page of posts
    Then I should be on the home page
