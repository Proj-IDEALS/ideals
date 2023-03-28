classes = {
    "theories" => Theory,
    "theory" => Theory,
    "assumptions" => Assumption,
    "assumption" => Assumption,
    "practices" => Practice,
    "practice" => Practice
}

Given('the following {word} exist:') do |entity_type, data_table|
    data_table.hashes.each do |data|
        classes[entity_type].create data
    end
  end

When (/^([^\(\)]*)(?:\(name="(.*)"\))? page is visited/) do |entity_type, param|
    if param.nil?
        visit send("#{entity_type}_path")
    else
        entity_id = classes[entity_type].find_by(name: param).id
        visit "/#{entity_type}/#{entity_id}"
    end
end

Then(/I should see "(.*)"/) do |content|
    expect(page).to have_text(content)
end

Then('I should see link to {word} named {string}')  do |entity_type, entity_name|
    entity = classes[entity_type].find_by(name: entity_name)
    expect(page).to have_link(href: "/#{entity_type}/#{entity.id}")

end
