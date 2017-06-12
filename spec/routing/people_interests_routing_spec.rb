require "rails_helper"

RSpec.describe PeopleInterestsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/people_interests").to route_to("people_interests#index")
    end

    it "routes to #new" do
      expect(:get => "/people_interests/new").to route_to("people_interests#new")
    end

    it "routes to #show" do
      expect(:get => "/people_interests/1").to route_to("people_interests#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/people_interests/1/edit").to route_to("people_interests#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/people_interests").to route_to("people_interests#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/people_interests/1").to route_to("people_interests#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/people_interests/1").to route_to("people_interests#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/people_interests/1").to route_to("people_interests#destroy", :id => "1")
    end

  end
end
