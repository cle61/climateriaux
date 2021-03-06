require 'rails_helper'

describe 'Dashboard', type: :feature do

  context "en tant qu'Admin" do
    let!(:user) { create :user, email: "admin@climateriaux.fr", role: "Admin" }

    before :each do
      create_user_and_log_in user
    end

    scenario "je peux accèder au dashboard du Back-office" do
      visit admin_path
      expect(page).to have_content "Dashboard"
    end
  end

  context "en tant que Merchant" do
    let!(:user) { create :user, email: "merchant@climateriaux.fr", role: "Merchant" }

    before :each do
      create_user_and_log_in user
    end

    scenario "je peux accèder au dashboard du Back-office" do
      visit admin_path
      expect(page).to have_content "Dashboard"
    end
  end

  context "en tant que Customer" do
    let!(:user) { create :user, email: "customer@climateriaux.fr", role: "Customer" }

    before :each do
      create_user_and_log_in user
    end

    scenario "je ne peux pas accéder au Back-office" do
      visit admin_path
      expect(page).to_not have_content "Dashboard"
    end
  end

  context "en tant que non connecté" do
    scenario "je ne peux pas accéder au Back-office" do
      visit admin_path
      expect(page).to_not have_content "Dashboard"
      expect(page).to have_content "Log in"
    end
  end
end