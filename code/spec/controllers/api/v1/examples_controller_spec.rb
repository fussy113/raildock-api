require 'rails_helper'

RSpec.describe Api::V1::ExamplesController, type: :controller do

  describe "GET /api/v1/examples" do
    before do
      FactoryBot.create(:examples_index_1)
      FactoryBot.create(:examples_index_2)
    end
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(Example.count).to eq json.count
    end
  end

  describe "GET /api/v1/examples/:id" do
    before do
      @example = FactoryBot.create(:examples_show)
    end
    it "returns http success" do
      get :show, params: { id: @example[:id].to_s }
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(@example.code).to eq json['code']
      expect(@example.value).to eq json['value']
    end
  end

  describe "POST /api/v1/exmples" do
    before do
      @example = FactoryBot.attributes_for(:examples_create)
    end
    it "returns http created" do
      post :create, params: { example: @example }
      expect(response).to have_http_status(:created)
      json = JSON.parse(response.body)
      expect(@example[:code]).to eq json['code']
      expect(@example[:value]).to eq json['value']
    end
  end

  describe "PUT /api/v1/exmples/:id" do
    before do
      @example_before = FactoryBot.create(:examples_update_before)
      @example = FactoryBot.attributes_for(:examples_update_after)
    end
    it "returns http success" do
      put :update, params: { id: @example_before['id'] ,example: @example }
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(@example[:code]).to eq json['code']
      expect(@example[:value]).to eq json['value']
    end
  end

  describe "DELETE /api/v1/examples/:id" do
    before do
      @example = FactoryBot.create(:examples_delete)
    end
    it "returns http success" do
      expect {
        delete :destroy, params: { id: @example['id'] }
      }.to change{ Example.count }.by(-1)
      expect(response).to have_http_status(:success)
    end
  end

end
