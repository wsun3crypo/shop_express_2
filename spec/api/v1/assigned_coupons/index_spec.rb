require "rails_helper"

RSpec.describe "assigned_coupons#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/assigned_coupons", params: params
  end

  describe "basic fetch" do
    let!(:assigned_coupon1) { create(:assigned_coupon) }
    let!(:assigned_coupon2) { create(:assigned_coupon) }

    it "works" do
      expect(AssignedCouponResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["assigned_coupons"])
      expect(d.map(&:id)).to match_array([assigned_coupon1.id,
                                          assigned_coupon2.id])
    end
  end
end
