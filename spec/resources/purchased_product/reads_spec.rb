require 'rails_helper'

RSpec.describe PurchasedProductResource, type: :resource do
  describe 'serialization' do
    let!(:purchased_product) { create(:purchased_product) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(purchased_product.id)
      expect(data.jsonapi_type).to eq('purchased_products')
    end
  end

  describe 'filtering' do
    let!(:purchased_product1) { create(:purchased_product) }
    let!(:purchased_product2) { create(:purchased_product) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: purchased_product2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([purchased_product2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:purchased_product1) { create(:purchased_product) }
      let!(:purchased_product2) { create(:purchased_product) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            purchased_product1.id,
            purchased_product2.id
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
            purchased_product2.id,
            purchased_product1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
