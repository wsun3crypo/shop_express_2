require 'rails_helper'

RSpec.describe "merchants#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/merchants/#{merchant.id}"
  end

  describe 'basic destroy' do
    let!(:merchant) { create(:merchant) }

    it 'updates the resource' do
      expect(MerchantResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Merchant.count }.by(-1)
      expect { merchant.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
