require 'rails_helper'

RSpec.describe "assigned_coupons#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/assigned_coupons", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'assigned_coupons',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(AssignedCouponResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { AssignedCoupon.count }.by(1)
    end
  end
end
