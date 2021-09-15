require 'rails_helper'

RSpec.describe "product_reviews#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/product_reviews/#{product_review.id}", payload
  end

  describe 'basic update' do
    let!(:product_review) { create(:product_review) }

    let(:payload) do
      {
        data: {
          id: product_review.id.to_s,
          type: 'product_reviews',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(ProductReviewResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { product_review.reload.attributes }
    end
  end
end
