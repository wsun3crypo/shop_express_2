require "rails_helper"

RSpec.describe "product_reviews#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/product_reviews", params: params
  end

  describe "basic fetch" do
    let!(:product_review1) { create(:product_review) }
    let!(:product_review2) { create(:product_review) }

    it "works" do
      expect(ProductReviewResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["product_reviews"])
      expect(d.map(&:id)).to match_array([product_review1.id,
                                          product_review2.id])
    end
  end
end
