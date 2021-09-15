require 'rails_helper'

RSpec.describe "merchant_partnerships#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/merchant_partnerships/#{merchant_partnership.id}", params: params
  end

  describe 'basic fetch' do
    let!(:merchant_partnership) { create(:merchant_partnership) }

    it 'works' do
      expect(MerchantPartnershipResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('merchant_partnerships')
      expect(d.id).to eq(merchant_partnership.id)
    end
  end
end
