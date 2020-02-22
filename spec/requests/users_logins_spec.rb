# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UsersLogins', type: :request do
  describe 'GET /users_logins' do
    it 'login with invalid information' do
      get login_path
      expect(response).to have_http_status(200)
      assert_template 'sessions/new'
      post login_path, params: { session: { email: '', password: '' } }
      assert_template 'sessions/new'
      get root_path
      assert flash.empty?
    end
  end
end
