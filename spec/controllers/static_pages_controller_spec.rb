require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  render_views

  let(:base_title) { 'Ruby on Rails Tutorial Sample App' }

  it "should get home" do
    get :home
    expect(response).to be_success
    assert_select "title", "Home | #{base_title}"
  end

  it "should get help" do
    get :help
    expect(response).to be_success
    assert_select "title", "Help | #{base_title}"
  end

  it "should get about" do
    get :about
    expect(response).to be_success
    assert_select "title", "About | #{base_title}"
  end

  it "should get contact" do
    get :contact
    expect(response).to be_success
    assert_select "title", "Contact | #{base_title}"
  end

end
