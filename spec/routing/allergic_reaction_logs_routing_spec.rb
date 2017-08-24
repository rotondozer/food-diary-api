require "rails_helper"

RSpec.describe AllergicReactionLogsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/allergic_reaction_logs").to route_to("allergic_reaction_logs#index")
    end

    it "routes to #new" do
      expect(:get => "/allergic_reaction_logs/new").to route_to("allergic_reaction_logs#new")
    end

    it "routes to #show" do
      expect(:get => "/allergic_reaction_logs/1").to route_to("allergic_reaction_logs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/allergic_reaction_logs/1/edit").to route_to("allergic_reaction_logs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/allergic_reaction_logs").to route_to("allergic_reaction_logs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/allergic_reaction_logs/1").to route_to("allergic_reaction_logs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/allergic_reaction_logs/1").to route_to("allergic_reaction_logs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/allergic_reaction_logs/1").to route_to("allergic_reaction_logs#destroy", :id => "1")
    end

  end
end
