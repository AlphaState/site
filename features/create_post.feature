Feature: Adding new posts to the blog
  In order to keep the blog up-to-date, registered users should
  have an exclusive right to create new posts.

  Scenario: A user creates a post
    Given I am a user
    And I am on the new page of posts
    When I enter the following:
      | field       | value                                         |
      | Title       | Bananas rule!                                 |
      | Author      | Ivan                                          |
      | Description | It’s all about bananas.                       |
      | Address     | bananas                                       |
      | Content     | So, you’ll be surprised when I tell you that… |
    And press "Save"
    Then I should be on the show page of the post "bananas"
    And I should see "Bananas rule!"

  Scenario: A visitor tries to create a post
    Given I am a visitor
    And there is one post
    When I go to the new page of posts
    Then I should be on the home page
