Given('starting-point page is visited') do
    visit root_path
end

When('I click on a link containing the word {word}') do |obj_type|
    click_link :text => /^.*#{obj_type}.*$/i
end

Then('I should see {word} list page') do |obj_type|
    expect(page).to have_current_path(send("#{obj_type}_path"))
end