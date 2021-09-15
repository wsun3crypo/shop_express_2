require 'rails_helper'

RSpec.describe AssignedCouponResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'assigned_coupons',
          attributes: { }
        }
      }
    end

    let(:instance) do
      AssignedCouponResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { AssignedCoupon.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:assigned_coupon) { create(:assigned_coupon) }

    let(:payload) do
      {
        data: {
          id: assigned_coupon.id.to_s,
          type: 'assigned_coupons',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      AssignedCouponResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { assigned_coupon.reload.updated_at }
      # .and change { assigned_coupon.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:assigned_coupon) { create(:assigned_coupon) }

    let(:instance) do
      AssignedCouponResource.find(id: assigned_coupon.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { AssignedCoupon.count }.by(-1)
    end
  end
end
