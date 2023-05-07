# frozen_string_literal: true

When(/^I visit my profile page as a registered user$/) do
  visit '/user/info'
end

Then(/^I should see my name$/) do
  expect(page).to have_content 'Test User'
end

And(/^I should see my email address$/) do
  expect(page).to have_content 'email'
end

When(/^I visit my profile page as a guest$/) do
  visit '/user/info'
end

Then(/^I should see a message telling me to log in$/) do
  iframe = find(:xpath, '//*[@id="iframe"]')
  page.driver.browser.switch_to.frame(iframe.native)
  expect(page).to have_content 'Log in is required. You do not have rights to perform that action. If you believe you have the rights, please log in with your account.'
  # Switch back to the main content
  page.driver.browser.switch_to.default_content
end
