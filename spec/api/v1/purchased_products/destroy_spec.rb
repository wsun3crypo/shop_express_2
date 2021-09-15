require 'rails_helper'

RSpec.describe "purchased_products#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/purchased_products/#{purchased_product.id}"
  end

  describe 'basic destroy' do
    let!(:purchased_product) { create(:purchased_product) }

    it 'updates the resource' do
      expect(PurchasedProductResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { PurchasedProduct.count }.by(-1)
      expect { purchased_product.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
