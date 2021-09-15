require 'rails_helper'

RSpec.describe "merchant_partnerships#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/merchant_partnerships/#{merchant_partnership.id}", payload
  end

  describe 'basic update' do
    let!(:merchant_partnership) { create(:merchant_partnership) }

    let(:payload) do
      {
        data: {
          id: merchant_partnership.id.to_s,
          type: 'merchant_partnerships',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(MerchantPartnershipResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { merchant_partnership.reload.attributes }
    end
  end
end
