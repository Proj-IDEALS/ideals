When('I browse to https:\/\/idealmaps.xyz\/') do
    Capybara.current_driver = :selenium
    Capybara.run_server = false
    visit 'https://idealmaps.xyz'
  end
  
  Then(/^I should get status code (\d+)$/) do |int|
    expect(page).to have_text /rails version/i
  end