require 'rails_helper'

RSpec.describe "Sprints", type: :request do
  describe "GET /sprints" do
    it "works! (now write some real specs)" do
      get sprints_path
      expect(response).to have_http_status(200)
    end
  end
end
