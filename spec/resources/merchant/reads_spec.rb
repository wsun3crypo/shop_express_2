require 'rails_helper'

RSpec.describe MerchantResource, type: :resource do
  describe 'serialization' do
    let!(:merchant) { create(:merchant) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(merchant.id)
      expect(data.jsonapi_type).to eq('merchants')
    end
  end

  describe 'filtering' do
    let!(:merchant1) { create(:merchant) }
    let!(:merchant2) { create(:merchant) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: merchant2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([merchant2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:merchant1) { create(:merchant) }
      let!(:merchant2) { create(:merchant) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            merchant1.id,
            merchant2.id
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
            merchant2.id,
            merchant1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
