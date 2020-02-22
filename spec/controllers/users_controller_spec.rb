# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'should get signup' do
      get :new
      expect(response).to be_success
    end
  end
end
