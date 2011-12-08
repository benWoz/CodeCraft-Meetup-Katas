Feature: smallest temperature data spread

Scenario: output the first day's temperature spread
  Given I have a weather data file
  When I process the file's first day
  Then I should see the first day's temperature spread

Scenario: output the day with the lowest temperature spread
  Given I have a weather data file
  When I process the entire file
  Then I should see the day with the lowest temperature spread
