require 'rails_helper'

RSpec.describe "merchants#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/merchants", params: params
  end

  describe 'basic fetch' do
    let!(:merchant1) { create(:merchant) }
    let!(:merchant2) { create(:merchant) }

    it 'works' do
      expect(MerchantResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['merchants'])
      expect(d.map(&:id)).to match_array([merchant1.id, merchant2.id])
    end
  end
end
