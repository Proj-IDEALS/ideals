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

Given('some {word} exist') do |entity_type|
    3.times do |i|
        entity = classes[entity_type].create(name:"#{entity_type}Test#{i}", description:"#{entity_type} #{i} description")
        entities[entity_type].append(entity)
    end
end

When ('{word} page is visited') do |entity_type|
    visit send("#{entity_type}_path")
end

Then("I should see a list of all {word}") do |entity_type|
    entities[entity_type].each do |entity|
        expect(page).to have_text(entity.name)   
    end
end