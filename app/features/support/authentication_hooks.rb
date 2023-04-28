Before('@auth') do
    # Code to perform default authentication actions
    ENV['CUCUMBER_Skip_Auth'] = 'false'
    visit '/'
    click_button 'Login'
    fill_in 'username', with: 'cucumber-test@idealmaps.xyz'
    fill_in 'password', with: 'cucumber-test-password-001'
    click_button 'Continue'
  end
  
  After('@auth') do
    # Code to perform default logout actions
    visit '/'
    click_button 'Logout'
    ENV['CUCUMBER_Skip_Auth'] = 'true'
  end
  