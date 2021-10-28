require 'rails_helper'

RSpec.describe "Patients", type: :request do
  describe "GET /patients/sign_in" do    
    it "get patient sign in" do
      get "/patients/sign_in"
      expect(response).to render_template("devise/sessions/new")
    end
  end
end
