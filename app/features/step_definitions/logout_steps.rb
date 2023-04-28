require 'capybara/cucumber'
require 'selenium-webdriver'
require 'browserstack/local'

Given('I am on the main page') do
  visit '/'
end

When('I click the logout button') do
  click_button 'Login'
  fill_in 'username', with: 'cucumber-test@idealmaps.xyz'
  fill_in 'password', with: 'cucumber-test-password-001'
  click_button 'Continue'
  expect(page).to have_content('Logout')
    click_button 'Logout'

end

Then('I should be returned to the main page') do
  expect(page).to have_content('Login')
end