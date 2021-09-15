require "rails_helper"

RSpec.describe "product_reviews#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/product_reviews/#{product_review.id}"
  end

  describe "basic destroy" do
    let!(:product_review) { create(:product_review) }

    it "updates the resource" do
      expect(ProductReviewResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { ProductReview.count }.by(-1)
      expect { product_review.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
