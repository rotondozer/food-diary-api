require 'rails_helper'

RSpec.describe "AllergicReactionLogs", type: :request do
  describe "GET /allergic_reaction_logs" do
    it "works! (now write some real specs)" do
      get allergic_reaction_logs_path
      expect(response).to have_http_status(200)
    end
  end
end
