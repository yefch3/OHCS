Feature: new patient sign up
  As a new patient
  I want to sign up

Scenario: new patient sign up
  Given I have signed up as default test patient
  Then  I should be on the patient profile page  