require 'rails_helper'

describe "Landing Page" do
  it 'displays title, new user button' do

    visit root_path

    expect(page).to have_content("Viewing Party")
    expect(page).to have_button("Create New User")
  end 
end
