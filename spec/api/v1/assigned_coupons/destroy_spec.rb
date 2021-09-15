require "rails_helper"

RSpec.describe "assigned_coupons#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/assigned_coupons/#{assigned_coupon.id}"
  end

  describe "basic destroy" do
    let!(:assigned_coupon) { create(:assigned_coupon) }

    it "updates the resource" do
      expect(AssignedCouponResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { AssignedCoupon.count }.by(-1)
      expect { assigned_coupon.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
