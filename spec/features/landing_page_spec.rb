require 'rails_helper'

describe "Landing Page" do
  before(:each) { visit root_path }

  it 'displays title, new user button' do
    expect(page).to have_content("Viewing Party")
    expect(page).to have_button("Create New User")
  end

  it 'can click button to create new user' do
    click_on "Create New User"

    expect(current_path).to eq new_user_path
  end

  it 'displays list of existing users' do
    user1 = create(:user)
    user2 = create(:user)
    user3 = create(:user)

    expect(page).to have_content("Existing Users: ")

    within("#user") do
      expect(page).to have_content(user1.name)
      expect(page).to have_content(user2.name)
      expect(page).to have_content(user3.name)
    end

    within(first("#user")) do
      expect(page).to have_link(user1.name)
      click_on user1.name
      expect(current_path).to eq user_path(user1)
    end
  end
end
