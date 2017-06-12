require 'rails_helper'

RSpec.describe ChargesController, type: :controller do

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #initialize" do
    it "returns http success" do
      get :initialize
      expect(response).to have_http_status(:success)
    end
  end

end
