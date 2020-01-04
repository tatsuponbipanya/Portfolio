require 'rails_helper'

RSpec.describe User, type: :model do

  describe "#create" do
    before do
      @user = User.new(name: "Example User", email: "user@example.com",
                      password: "foobar", password_confirmation: "foobar")
    end

    it "should be valid" do
      expect(@user).to be_valid
    end

    it "name should be present" do
      @user.name = "     "
      expect(@user).not_to be_valid
    end

    it "email should be present" do
      @user.email = "     "
      expect(@user).not_to be_valid
    end

    it "name should not be too long" do
      @user.name = "a" * 51
      expect(@user).not_to be_valid
    end

    it "email should not be too long" do
      @user.email = "a" * 244 + "@example.com"
      expect(@user).not_to be_valid
    end

    it "email validation should accept valid addresses" do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                           first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid, "#{valid_address.inspect} should be valid"
      end
    end

    it "email validation should reject invalid addresses" do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                             foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        @user.email = invalid_addresses
        expect(@user).not_to be_valid, "#{invalid_address.inspect} should be invalid"
      end
    end

    it "email addresses should be unique" do
      duplicate_user = @user.dup                  #dup = 同じ属性を持つデータを複製するメソッド。
      duplicate_user.email = @user.email.upcase   #upcase = emailを全て大文字に変換。
      @user.save
      expect(duplicate_user).not_to be_valid
    end

    it "password should be present (nonblank)" do
      @user.password = @user.password_confirmation = " " * 6
      expect(@user).not_to be_valid
    end

    it "password should have a minumum length" do
      @user.password = @user.password_confirmation = "a" * 5
      expect(@user).not_to be_valid
    end

  end
end
