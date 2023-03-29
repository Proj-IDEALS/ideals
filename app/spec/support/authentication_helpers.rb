module AuthenticationHelpers
    def sign_in_as_test_user
      session[:userinfo] = { "name" => "Test User", "email" => "test-user@example.com" }
    end
  end