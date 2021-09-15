require 'rails_helper'

RSpec.describe CouponResource, type: :resource do
  describe 'serialization' do
    let!(:coupon) { create(:coupon) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(coupon.id)
      expect(data.jsonapi_type).to eq('coupons')
    end
  end

  describe 'filtering' do
    let!(:coupon1) { create(:coupon) }
    let!(:coupon2) { create(:coupon) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: coupon2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([coupon2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:coupon1) { create(:coupon) }
      let!(:coupon2) { create(:coupon) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            coupon1.id,
            coupon2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            coupon2.id,
            coupon1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
