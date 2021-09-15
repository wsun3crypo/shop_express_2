require 'rails_helper'

RSpec.describe MerchantPartnershipResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'merchant_partnerships',
          attributes: { }
        }
      }
    end

    let(:instance) do
      MerchantPartnershipResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { MerchantPartnership.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:merchant_partnership) { create(:merchant_partnership) }

    let(:payload) do
      {
        data: {
          id: merchant_partnership.id.to_s,
          type: 'merchant_partnerships',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      MerchantPartnershipResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { merchant_partnership.reload.updated_at }
      # .and change { merchant_partnership.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:merchant_partnership) { create(:merchant_partnership) }

    let(:instance) do
      MerchantPartnershipResource.find(id: merchant_partnership.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { MerchantPartnership.count }.by(-1)
    end
  end
end
