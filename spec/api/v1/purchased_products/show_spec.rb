require "rails_helper"

RSpec.describe "purchased_products#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/purchased_products/#{purchased_product.id}",
                params: params
  end

  describe "basic fetch" do
    let!(:purchased_product) { create(:purchased_product) }

    it "works" do
      expect(PurchasedProductResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("purchased_products")
      expect(d.id).to eq(purchased_product.id)
    end
  end
end
