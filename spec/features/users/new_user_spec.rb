require 'rails_helper'

describe "New User Registration Page" do
  it 'has form to register new user' do
    visit register_path

    expect(page).to have_content "Register New User"

    name = "Billy Bob"
    email = "funnybucket@email.com"

    fill_in :name, with: name
    fill_in :email, with: email

    click_on "Register"

    user = User.first

    expect(current_path).to eq user_path(user)
    expect(page).to have_content "#{name}'s Dashboard"
  end
end
