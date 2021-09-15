require 'rails_helper'

RSpec.describe "merchant_partnerships#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/merchant_partnerships/#{merchant_partnership.id}"
  end

  describe 'basic destroy' do
    let!(:merchant_partnership) { create(:merchant_partnership) }

    it 'updates the resource' do
      expect(MerchantPartnershipResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { MerchantPartnership.count }.by(-1)
      expect { merchant_partnership.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
