# spec/hello_spec.rb をこう書き換えてみて！
require 'spec_helper'

RSpec.describe "テストの練習" do
  it "1 + 1 は 2 であること" do
    expect(1 + 1).to eq 2
  end
end