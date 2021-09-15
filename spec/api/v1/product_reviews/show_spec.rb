require "rails_helper"

RSpec.describe "product_reviews#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/product_reviews/#{product_review.id}", params: params
  end

  describe "basic fetch" do
    let!(:product_review) { create(:product_review) }

    it "works" do
      expect(ProductReviewResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("product_reviews")
      expect(d.id).to eq(product_review.id)
    end
  end
end
