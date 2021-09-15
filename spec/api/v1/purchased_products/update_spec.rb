require 'rails_helper'

RSpec.describe "purchased_products#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/purchased_products/#{purchased_product.id}", payload
  end

  describe 'basic update' do
    let!(:purchased_product) { create(:purchased_product) }

    let(:payload) do
      {
        data: {
          id: purchased_product.id.to_s,
          type: 'purchased_products',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(PurchasedProductResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { purchased_product.reload.attributes }
    end
  end
end
