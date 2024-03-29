# frozen_string_literal: true

module RequestHelpers
  def set_session(vars = {})
    post test_session_path, params: { session_vars: vars }
    expect(response).to have_http_status(:created)

    vars.each_key do |var|
      expect(session[var]).to be_present
    end
  end

  def set_session_user
    set_session(userinfo: { 'name' => 'Test User', 'email' => 'test-user@example.com' })
  end
end
