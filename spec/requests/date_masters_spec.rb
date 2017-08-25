require 'rails_helper'

RSpec.describe "DateMasters", type: :request do
  describe "GET /date_masters" do
    it "works! (now write some real specs)" do
      get date_masters_path
      expect(response).to have_http_status(200)
    end
  end
end
