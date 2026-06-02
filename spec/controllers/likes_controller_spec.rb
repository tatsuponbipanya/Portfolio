# frozen_string_literal: true

require 'rails_helper'

    RSpec.describe LikesController, type: :controller do
  let(:user) { User.create(name: "Test", email: "test@a.com", password: "password") }
  let(:micropost) { Micropost.create!(content: "test", user_id: user.id) }

  before do
    # セッションにユーザーIDを入れて、ログイン状態をエミュレートする
    session[:user_id] = user.id
  end

  describe 'POST #create' do
    it 'いいねが作成されること' do
      # paramsのキーが :micropost_id であることを確認
      post :create, params: { micropost_id: micropost.id }
      
      expect(Like.count).to eq(1)
    end
  end
end
