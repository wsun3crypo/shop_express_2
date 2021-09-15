require "rails_helper"

RSpec.describe AssignedCouponResource, type: :resource do
  describe "serialization" do
    let!(:assigned_coupon) { create(:assigned_coupon) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(assigned_coupon.id)
      expect(data.jsonapi_type).to eq("assigned_coupons")
    end
  end

  describe "filtering" do
    let!(:assigned_coupon1) { create(:assigned_coupon) }
    let!(:assigned_coupon2) { create(:assigned_coupon) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: assigned_coupon2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([assigned_coupon2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:assigned_coupon1) { create(:assigned_coupon) }
      let!(:assigned_coupon2) { create(:assigned_coupon) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      assigned_coupon1.id,
                                      assigned_coupon2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      assigned_coupon2.id,
                                      assigned_coupon1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
