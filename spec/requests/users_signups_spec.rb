# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UsersSignups', type: :request do
  it 'valid signup information' do
    get signup_path
    expect do
      post users_path, params: { user: { name: 'Example User',
                                         email: 'user@example.com',
                                         password: 'password',
                                         password_confirmation: 'password' } }
    end.to change(User, :count).by(1)
    redirect_to @user
    follow_redirect!
    # Test
    assert_template 'users/show'
    assert is_logged_in?
  end
end
