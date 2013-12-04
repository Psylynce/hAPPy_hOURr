Feature: display a list of bars

	As a user
	So that I can find local bars
	I want to see a list of local bars

Background: Given bars exist

Scenario: display a list of bars
	Given I am on the Happy Hour Bars page
	Then I should see a list of bars
	And I should see "Aji"

