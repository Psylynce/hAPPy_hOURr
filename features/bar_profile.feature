Feature: view a bar's profile

	As a user
	So that I can find more information about a bar
	I want to be able to click on a bar's name for more info

Background: Given a bar exists

Scenario: A user should be able to see a bars profile
	Given I am on the Happy Hour Bars page
	And I click on a bar
	Then I should be redirected to that bar's profile page