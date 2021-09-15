require "rails_helper"

RSpec.describe "assigned_coupons#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/assigned_coupons/#{assigned_coupon.id}", payload
  end

  describe "basic update" do
    let!(:assigned_coupon) { create(:assigned_coupon) }

    let(:payload) do
      {
        data: {
          id: assigned_coupon.id.to_s,
          type: "assigned_coupons",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(AssignedCouponResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { assigned_coupon.reload.attributes }
    end
  end
end
