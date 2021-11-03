Capybara.match = :prefer_exact

test_patient = {:email => "patient@host.com", :username => "patient1", :password => "s3cr3t"}

Given ('I have signed up as default test patient') do
  visit('/patients/sign_up')
  fill_in('Email', :with => test_patient[:email])
  fill_in('Username', :with => test_patient[:username])
  fill_in('Password', :with => test_patient[:password])
  fill_in('Password confirmation', :with => test_patient[:password])
  click_button('Sign up')
end

Then('I should be on the home page') do
  expect(page).to have_content "Patient Login"
end

Then('I should be on the patient profile page') do
  expect(page).to have_content "Patient Profile"
end

Then('I should be on the log in page') do
  expect(page).to have_content "Log in"
end

And('I should see invalid login message') do
  expect(page).to have_content "Invalid Email or password"
end

Given('the default test patient exist') do
  Patient.create(test_patient)
end

Given('I have login with the correct credential') do
  visit('/patients/sign_in')
  fill_in('Email', :with => test_patient[:email])
  fill_in('Password', :with => test_patient[:password])
  click_button('Log in')
end

Given('I have login with the wrong credential') do
  visit('/patients/sign_in')
  fill_in('Email', :with => test_patient[:email])
  fill_in('Password', :with => 'wrong')
  click_button('Log in')
end

Given('I logout') do
  # select "Logout", :from => "navbarDropdown"
  # # click_button(test_patient[:username])
  click_button('Logout')
end

Then('I should see the sign out message') do
  expect(page).to have_content "Signed out successfully"
end

# select "option_name_here", :from => "organizationSelect"