theories = []
assumptions = []
practices = []

entities = {
    "theories" => [],
    "assumptions" => [],
    "practices" => []
}

classes = {
    "theories" => Theory,
    "assumptions" => Assumption,
    "practices" => Practice
}

num_of_entities = 3

Given('some {word} exist') do |entity_type|
    num_of_entities.times do |i|
        entity = classes[entity_type].create(name:"#{entity_type}Test#{i}", description:"#{entity_type} #{i} description")
        entities[entity_type].append(entity)
    end
end

When ('{word} page is visited') do |entity_type|
    visit send("#{entity_type}_path")
end

Then("I should see a list of all {word} and links") do |entity_type|
    num_of_entities.times do |i|
        expect(page).to have_text(entities[entity_type][i].name)
        # expect(page).to have_link(href: send("#{entity_type}_path(#{i})"))
        expect(page).to have_link(href: "/#{entity_type}/#{i+1}")
    end
end