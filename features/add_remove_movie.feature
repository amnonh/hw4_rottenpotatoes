Feature: add and remove movie

  As a movie buff
  So that I can update the exist movie list
  I want to add and remove movies

Background: movies in database
  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  And I am on the home page
  And I check the following ratings: PG, R, G, PG-13
  And I press "Refresh"

Scenario: add movie
  When I follow "Add new movie"
  And I fill in "Title" with "Go"
  And I press "Save Changes"
  Then I should be on the home page
  And I check the following ratings: PG, R, G, PG-13
  And I press "Refresh"
  And I should see "Go"

Scenario: remove movie
  When I follow "More about Star Wars"
  Then press "Delete"
  Then I should be on the home page
  And I check the following ratings: PG, R, G, PG-13
  And I press "Refresh"
  And I should not see "Star Wars"
