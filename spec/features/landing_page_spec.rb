require 'rails_helper'

describe "Landing Page" do
  it 'displays title, new user button' do

    visit root_path

    expect(page).to have_content("Viewing Party")
    expect(page).to have_button("Create New User")
  end

  it 'can click button to create new user' do
    visit root_path

    click_on "Create New User"

    expect(current_path).to eq new_user_path
  end
end
