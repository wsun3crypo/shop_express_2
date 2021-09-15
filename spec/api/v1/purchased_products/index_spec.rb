require "rails_helper"

RSpec.describe "purchased_products#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/purchased_products", params: params
  end

  describe "basic fetch" do
    let!(:purchased_product1) { create(:purchased_product) }
    let!(:purchased_product2) { create(:purchased_product) }

    it "works" do
      expect(PurchasedProductResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["purchased_products"])
      expect(d.map(&:id)).to match_array([purchased_product1.id,
                                          purchased_product2.id])
    end
  end
end
