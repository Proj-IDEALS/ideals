require 'capybara/cucumber'
require 'selenium-webdriver'
require 'browserstack/local'

Given('I am on the login page') do
  visit '/'
end

When('I enter valid credentials') do
    click_button 'Login'
  fill_in 'username', with: 'cucumber-test@idealmaps.xyz'
  fill_in 'password', with: 'cucumber-test-password-001'
  click_button 'Continue'
  
end

Then('I should be redirected to the main page') do
  expect(page).to have_content('Logout')
end