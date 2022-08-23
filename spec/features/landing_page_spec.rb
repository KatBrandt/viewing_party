require 'rails_helper'

describe "Landing Page" do
  before(:each) do
    @user1 = create(:user)
    @user2 = create(:user)
    @user3 = create(:user)
    visit root_path
  end

  it 'displays title, new user button' do

    expect(page).to have_content("Viewing Party")
    expect(page).to have_button("Create New User")
  end

  it 'can click button to create new user' do
    click_on "Create New User"

    expect(current_path).to eq register_path
  end

  it 'displays list of existing users' do

    expect(page).to have_content("Existing Users:")

    within("#users") do
      expect(page).to have_content(@user1.name)
      expect(page).to have_content(@user2.name)
      expect(page).to have_content(@user3.name)
    end

    within(first("#users")) do
      expect(page).to have_link(@user1.name)
      click_on @user1.name
      expect(current_path).to eq user_path(@user1)
    end
  end

  it 'displays link to landing page on all pages' do
    expect(page).to have_link "Home"

    visit user_path(@user1)
    expect(page).to have_link "Home"
  end
end
