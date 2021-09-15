require 'rails_helper'

RSpec.describe "merchant_partnerships#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/merchant_partnerships", params: params
  end

  describe 'basic fetch' do
    let!(:merchant_partnership1) { create(:merchant_partnership) }
    let!(:merchant_partnership2) { create(:merchant_partnership) }

    it 'works' do
      expect(MerchantPartnershipResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['merchant_partnerships'])
      expect(d.map(&:id)).to match_array([merchant_partnership1.id, merchant_partnership2.id])
    end
  end
end
