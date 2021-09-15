require "rails_helper"

RSpec.describe "coupons#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/coupons/#{coupon.id}", payload
  end

  describe "basic update" do
    let!(:coupon) { create(:coupon) }

    let(:payload) do
      {
        data: {
          id: coupon.id.to_s,
          type: "coupons",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(CouponResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { coupon.reload.attributes }
    end
  end
end
