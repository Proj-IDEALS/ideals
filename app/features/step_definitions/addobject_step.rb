Given("I am on the new theory page") do
    visit new_theory_path
  end
  
  When("I fill in the theory form with valid data") do
    fill_in "Name", with: "Core Theory 1"
    fill_in "Description", with: "How to learning."
  end
  
  When("I click the {string} button") do |button_name|
    click_button button_name
  end
  
  Then("I should see the new theory's details") do
    theory = Theory.last
    expect(page).to have_content(theory.name)
    expect(page).to have_content(theory.description)
  end
  

Given("I am on the new assumption page") do
  visit new_assumption_path
end

  When("I fill in the assumption form with valid data") do
    fill_in "Name", with: "Assumption 1"
    fill_in "Description", with: "The assumption mentions that........"
  end


  Then("I should see the new assumption's details") do
    assumption = Assumption.last
    expect(page).to have_content(assumption.name)
    expect(page).to have_content(assumption.description)
  end

Given("I am on the new practice page") do
  visit new_practice_path
end

  When("I fill in the practice form with valid data") do
    fill_in "Name", with: "Practice 1"
    fill_in "Description", with: "Here is the way for how to improve the skill."
  end

  Then("I should see the new practice's details") do
    practice = Practice.last
    expect(page).to have_content(practice.name)
    expect(page).to have_content(practice.description)
  end
