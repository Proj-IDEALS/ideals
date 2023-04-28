# frozen_string_literal: true

def fill_in_rich_text_area(_locator = nil, with:)
  find('trix-editor').execute_script('this.editor.loadHTML(arguments[0])', with.to_s)
end

Given('I am on the new theory page as a login user') do
  visit new_theory_path
end

When('I fill in the theory form with valid data as a login user') do
  fill_in 'Name', with: 'Authorization test theory'
  fill_in_rich_text_area 'theory_description', with: 'Authorization Test Theory Description'
end

When('I click the {string} button as a login user') do |button_name|
  click_button button_name
end

Then("I should see the new theory's details as a login user") do
  expect(page).to have_content('Authorization test theory')
  expect(page).to have_content('Authorization Test Theory Description')
end

Given('I am on the new assumption page as a login user') do
  visit new_assumption_path
end

When('I fill in the assumption form with valid data as a login user') do
  fill_in 'Name', with: 'Authorization test assumption 1'
  fill_in_rich_text_area 'assumption_description', with: 'The assumption mentions that........'
end

Then("I should see the new assumption's details as a login user") do
  expect(page).to have_content('Authorization test assumption 1')
  expect(page).to have_content('The assumption mentions that........')
end

Given('I am on the new practice page as a login user') do
  visit new_practice_path
end

When('I fill in the practice form with valid data as a login user') do
  fill_in 'Name', with: 'Authorization test practice 1'
  fill_in_rich_text_area 'practice_description', with: 'Here is the way for how to improve the skill.'
end

Then("I should see the new practice's details as a login user") do
  expect(page).to have_content('Authorization test practice 1')
  expect(page).to have_content('Here is the way for how to improve the skill.')
end
