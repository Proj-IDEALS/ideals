# features/step_definitions/map_view_steps.rb

Given(/^I have created assumptions, theories, practices and their associations$/) do
  @assumptions = Array.new(3) { Assumption.create(name: "Assumption #{rand(1000)}",
                                                  description: "A sample assumption description.") }
  @theories = Array.new(2) { Theory.create(name: "Theory #{rand(1000)}",
                                           description: "A sample theory description.") }
  @practices = Array.new(4) { Practice.create(name: "Practice #{rand(1000)}",
                                              description: "A sample practice description.") }

  @assumptions[0].theories << @theories[0]
  @assumptions[0].practices << @practices[0]
  @assumptions[1].theories << @theories[1]
  @assumptions[1].practices << @practices[1]
  @assumptions[2].theories << @theories[0]
  @assumptions[2].practices << @practices[2]
end

When(/^I visit the map page$/) do
  visit '/map'
end

Then(/^I should see the IDEALS logo$/) do
  expect(page).to have_css('.logo', text: 'IDEALS')
end

Then(/^I should see the search icon$/) do
  expect(page).to have_css('.bi-search')
end

Then(/^I should see an iframe$/) do
  expect(page).to have_css('iframe')
end

Then(/^I should see the concept-map container$/) do
  expect(page).to have_css('#concept-map')
end

When(/^I request the concept map data$/) do
  visit 'api/v1/map'
  @json_response = JSON.parse(page.body)
end

Then(/^the JSON response should contain the correct nodes and edges$/) do
  expect(@json_response['assumptions'].length).to eq(@assumptions.count)
  expect(@json_response['theories'].length).to eq(@theories.count)
  expect(@json_response['practices'].length).to eq(@practices.count)
end
