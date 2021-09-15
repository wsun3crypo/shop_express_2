require "rails_helper"

RSpec.describe "coupons#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/coupons/#{coupon.id}", params: params
  end

  describe "basic fetch" do
    let!(:coupon) { create(:coupon) }

    it "works" do
      expect(CouponResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("coupons")
      expect(d.id).to eq(coupon.id)
    end
  end
end
