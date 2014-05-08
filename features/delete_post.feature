Feature: Removing posts from the blog
  In order to keep the blog clean, registered users should
  have an exclusive right to delete posts.

  Background:
    Given there is one post

  Scenario: A user deletes a post
    Given I am a user
    And I am on the edit page of a post
    When I press "Delete"
    Then I should be on the index page of posts
    And there should be no posts

  Scenario: A visitor tries to delete a post
    Given I am a visitor
    When I go to the edit page of a post
    Then I should be on the home page
