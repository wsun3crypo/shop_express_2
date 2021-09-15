require 'rails_helper'

RSpec.describe "assigned_coupons#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/assigned_coupons/#{assigned_coupon.id}", params: params
  end

  describe 'basic fetch' do
    let!(:assigned_coupon) { create(:assigned_coupon) }

    it 'works' do
      expect(AssignedCouponResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('assigned_coupons')
      expect(d.id).to eq(assigned_coupon.id)
    end
  end
end
