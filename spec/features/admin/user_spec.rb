require 'rails_helper'

describe 'admin/user', type: :feature do

  context "en tant qu'Admin" do
    let!(:user) { create :user, email: "admin@climateriaux.fr", role: "admin" }

    before :each do
      create_user_and_log_in user
    end

    scenario "je peux voir tous les utilisateurs" do
      user_1 = create :user, email: "user1@exemple.fr"
      user_2 = create :user, email: "user2@exemple.fr"
      visit admin_users_path
      expect(page).to have_content "user1@exemple.fr"
      expect(page).to have_content "user2@exemple.fr"
    end
  end
end