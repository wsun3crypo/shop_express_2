require "rails_helper"

RSpec.describe CouponResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "coupons",
          attributes: {},
        },
      }
    end

    let(:instance) do
      CouponResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Coupon.count }.by(1)
    end
  end

  describe "updating" do
    let!(:coupon) { create(:coupon) }

    let(:payload) do
      {
        data: {
          id: coupon.id.to_s,
          type: "coupons",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      CouponResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { coupon.reload.updated_at }
      # .and change { coupon.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:coupon) { create(:coupon) }

    let(:instance) do
      CouponResource.find(id: coupon.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Coupon.count }.by(-1)
    end
  end
end
