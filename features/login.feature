Feature: existing patient log in
  As a existing patient
  I want to log in

Background: default patient exists
  Given the default test patient exist

Scenario: existing patient login correct password
  Given I have login with the correct credential
  Then  I should be on the patient profile page

Scenario: existing patient login wrong password
  Given I have login with the wrong credential
  Then  I should be on the log in page 
  And I should see invalid login message

Scenario: patient logout
  Given I have login with the correct credential
  And  I logout
  Then I should be on the home page
  And I should see the sign out message