Feature: Manage the blog
  In order to maintain the blog
  As an administrator
  I want to manipulate the content of the blog

  Scenario: Delete a post
    Given I have one post
    And I am on the edit page of that post
    When I press "Delete"
    Then I should be on the list of posts
    And I should see no posts
