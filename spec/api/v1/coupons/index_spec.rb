require "rails_helper"

RSpec.describe "coupons#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/coupons", params: params
  end

  describe "basic fetch" do
    let!(:coupon1) { create(:coupon) }
    let!(:coupon2) { create(:coupon) }

    it "works" do
      expect(CouponResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["coupons"])
      expect(d.map(&:id)).to match_array([coupon1.id, coupon2.id])
    end
  end
end
