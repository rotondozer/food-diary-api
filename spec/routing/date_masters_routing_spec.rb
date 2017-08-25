require "rails_helper"

RSpec.describe DateMastersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/date_masters").to route_to("date_masters#index")
    end

    it "routes to #new" do
      expect(:get => "/date_masters/new").to route_to("date_masters#new")
    end

    it "routes to #show" do
      expect(:get => "/date_masters/1").to route_to("date_masters#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/date_masters/1/edit").to route_to("date_masters#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/date_masters").to route_to("date_masters#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/date_masters/1").to route_to("date_masters#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/date_masters/1").to route_to("date_masters#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/date_masters/1").to route_to("date_masters#destroy", :id => "1")
    end

  end
end
