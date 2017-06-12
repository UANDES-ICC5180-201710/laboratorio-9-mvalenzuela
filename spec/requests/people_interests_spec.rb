require 'rails_helper'

RSpec.describe "PeopleInterests", type: :request do
  describe "GET /people_interests" do
    it "works! (now write some real specs)" do
      get people_interests_path
      expect(response).to have_http_status(200)
    end
  end
end
