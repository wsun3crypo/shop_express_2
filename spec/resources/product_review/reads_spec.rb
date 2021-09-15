require 'rails_helper'

RSpec.describe ProductReviewResource, type: :resource do
  describe 'serialization' do
    let!(:product_review) { create(:product_review) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(product_review.id)
      expect(data.jsonapi_type).to eq('product_reviews')
    end
  end

  describe 'filtering' do
    let!(:product_review1) { create(:product_review) }
    let!(:product_review2) { create(:product_review) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: product_review2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([product_review2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:product_review1) { create(:product_review) }
      let!(:product_review2) { create(:product_review) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            product_review1.id,
            product_review2.id
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
            product_review2.id,
            product_review1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
