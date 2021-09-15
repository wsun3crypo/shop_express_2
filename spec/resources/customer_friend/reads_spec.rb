require 'rails_helper'

RSpec.describe CustomerFriendResource, type: :resource do
  describe 'serialization' do
    let!(:customer_friend) { create(:customer_friend) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(customer_friend.id)
      expect(data.jsonapi_type).to eq('customer_friends')
    end
  end

  describe 'filtering' do
    let!(:customer_friend1) { create(:customer_friend) }
    let!(:customer_friend2) { create(:customer_friend) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: customer_friend2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([customer_friend2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:customer_friend1) { create(:customer_friend) }
      let!(:customer_friend2) { create(:customer_friend) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            customer_friend1.id,
            customer_friend2.id
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
            customer_friend2.id,
            customer_friend1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
