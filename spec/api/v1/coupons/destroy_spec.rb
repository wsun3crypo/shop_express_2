require 'rails_helper'

RSpec.describe "coupons#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/coupons/#{coupon.id}"
  end

  describe 'basic destroy' do
    let!(:coupon) { create(:coupon) }

    it 'updates the resource' do
      expect(CouponResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Coupon.count }.by(-1)
      expect { coupon.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
