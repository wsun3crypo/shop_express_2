require 'rails_helper'

RSpec.describe LoyaltyProgramResource, type: :resource do
  describe 'serialization' do
    let!(:loyalty_program) { create(:loyalty_program) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(loyalty_program.id)
      expect(data.jsonapi_type).to eq('loyalty_programs')
    end
  end

  describe 'filtering' do
    let!(:loyalty_program1) { create(:loyalty_program) }
    let!(:loyalty_program2) { create(:loyalty_program) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: loyalty_program2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([loyalty_program2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:loyalty_program1) { create(:loyalty_program) }
      let!(:loyalty_program2) { create(:loyalty_program) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            loyalty_program1.id,
            loyalty_program2.id
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
            loyalty_program2.id,
            loyalty_program1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
