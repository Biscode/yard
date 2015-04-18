require 'rails_helper'

RSpec.describe NotificationsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "Create Notification" do
    it "creates notification with user1 as the owner and user2 as the notified user" do
      @user1 = User.create!(email: "ahmedsaleh8@gmail.com", password: "12345678")
      @user2 = User.create!(email: "Zayd5@gmail.com", password: "12345678")
      @team = Team.create!(name: "Squad 1")

      @user2.create_activity :create, owner: @user1, parameters: {subject_id: @team.id}

      expect(PublicActivity::Activity.last.owner.email).to eq "ahmedsaleh8@gmail.com"
    end
  end

end
