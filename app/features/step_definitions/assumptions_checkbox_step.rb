Given("I have the following theories:") do |table|
    table.hashes.each do |row|
      Theory.create!(row)
    end
  end
  
  Given("I have the following practices:") do |table|
    table.hashes.each do |row|
      Practice.create!(row)
    end
  end
  
  Given("I am on creating new assumption page") do
    visit new_assumption_path
  end
  
  When("I enter {string} as the assumption name") do |assumption_name|
    fill_in "Name", with: assumption_name
  end
  
  When("I select {string} and {string} as theories") do |theory1, theory3|
    check(theory1)
    check(theory3)
  end
  
  When("I select {string} and {string} as practices") do |practice1, practice2|
    check(practice1)
    check(practice2)
  end
  
  When("I click on the {string} button") do |button|
    click_button(button)
  end
  
  Then("I should see the selected theories and practices associated with the assumption") do
    expect(page).to have_content "Theory1"
    expect(page).to_not have_content "Theory2"
    expect(page).to have_content "Theory3"
    expect(page).to have_content "Practice1"
    expect(page).to have_content "Practice2"
    expect(page).to_not have_content "Practice3"
  end
  