require 'rails_helper'

RSpec.describe "merchants#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/merchants/#{merchant.id}", params: params
  end

  describe 'basic fetch' do
    let!(:merchant) { create(:merchant) }

    it 'works' do
      expect(MerchantResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('merchants')
      expect(d.id).to eq(merchant.id)
    end
  end
end
