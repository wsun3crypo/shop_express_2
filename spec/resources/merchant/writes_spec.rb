require 'rails_helper'

RSpec.describe MerchantResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'merchants',
          attributes: { }
        }
      }
    end

    let(:instance) do
      MerchantResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Merchant.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:merchant) { create(:merchant) }

    let(:payload) do
      {
        data: {
          id: merchant.id.to_s,
          type: 'merchants',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      MerchantResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { merchant.reload.updated_at }
      # .and change { merchant.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:merchant) { create(:merchant) }

    let(:instance) do
      MerchantResource.find(id: merchant.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Merchant.count }.by(-1)
    end
  end
end
