require 'rails_helper'

describe "User logs in with github" do
  it "shows them being logged in" do
    VCR.use_cassette("user_information") do
      visit "/"
      stub_omniauth

      expect(page.status_code).to eq(200)

      click_link "Login with GitHub"

      expect(current_path).to eq("/users/#{User.last.id}")
      expect(page).to have_content("calaway")
      expect(page).to have_link("Logout")
    end
  end

  it "shows them their account info" do
    VCR.use_cassette("user_information") do
      visit "/"
      expect(current_path).to eq("/")
      stub_omniauth
      click_link "Login with GitHub"

      expect(current_path).to eq(user_path(User.last.id))
      expect(page).to have_content("Studying full stack web development at Turing School of Software & Design. (Turing.io)")
    end
  end
end
