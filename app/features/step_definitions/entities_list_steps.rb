# frozen_string_literal: true
# Then("I should see a list of all {word} and links") do |entity_type|
#     num_of_entities.times do |i|
#         expect(page).to have_text(entities[entity_type][i].name)
#         expect(page).to have_link(href: "/#{entity_type}/#{i+1}")
#     end
# end

# Then('I should see link to theories named {string}') do |entity_name|
#     entity_type = theories
#     entity = classes[entity_type].find_by(name: entity_name)
#     expect(page).to have_link(href: "/#{entity_type}/#{entity.id}")
# end
