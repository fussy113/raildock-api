require 'rails_helper'

RSpec.describe Api::V1::GreetingsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      json = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(json['message']).to eq 'Hello, World!'
    end
  end

end
