classes = {
    "theories" => Theory,
    "assumptions" => Assumption,
    "practices" => Practice
}

Given('the following {word} exist:') do |entity_type, data_table|
    data_table.hashes.each do |data|
        print(data)
        classes[entity_type].create data
    end
  end

When ('{word} page is visited') do |link|
    visit send("#{link}_path")
end

Then(/I should see "(.*)"/) do |content|
    expect(page).to have_text(content)
end