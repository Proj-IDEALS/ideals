# frozen_string_literal: true

Given('I have the following assumptions:') do |table|
  table.hashes.each do |row|
    Assumption.create!(row)
  end
end

Given('I am on adding new theory page') do
  visit new_theory_path
end

When('I enter {string} as the theory name') do |theory_name|
  fill_in 'Name', with: theory_name
end

When('I select {string} and {string} as assumptions') do |assumption1, assumption3|
  check(assumption1)
  check(assumption3)
end

When('I click this {string} button') do |button|
  click_button(button)
end

Then('I should see the selected assumptions associated with the theory') do
  expect(page).to have_content 'Assumption1'
  expect(page).to have_content 'Assumption3'
  expect(page).to_not have_content 'Assumption2'
end
