require 'rails_helper'

RSpec.describe "merchants#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/merchants/#{merchant.id}", payload
  end

  describe 'basic update' do
    let!(:merchant) { create(:merchant) }

    let(:payload) do
      {
        data: {
          id: merchant.id.to_s,
          type: 'merchants',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(MerchantResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { merchant.reload.attributes }
    end
  end
end
