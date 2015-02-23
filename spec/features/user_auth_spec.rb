require 'rails_helper'

describe 'User can log in with valid creds' do

  before :each do
    visit root_path
  end

  it 'User can register' do
    click_link 'Register'
    fill_in "User name", with: "test"
    fill_in "Password", with: "123"
    fill_in "Confirm", with: "123"
    click_button 'Sign Up'
    expect(page).to have_content 'test'
  end

  it 'User can log in with valid creds' do
    @user = User.create(user_name: "test1", password: "1234")
    click_link 'Login'
    fill_in "User name", with: "test1"
    fill_in "Password", with: "1234"
    click_button 'Login'
    expect(page).to have_content 'test1'

  end

end
