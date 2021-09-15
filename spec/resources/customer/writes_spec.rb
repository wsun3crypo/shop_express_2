require 'rails_helper'

RSpec.describe CustomerResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'customers',
          attributes: { }
        }
      }
    end

    let(:instance) do
      CustomerResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Customer.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:customer) { create(:customer) }

    let(:payload) do
      {
        data: {
          id: customer.id.to_s,
          type: 'customers',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      CustomerResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { customer.reload.updated_at }
      # .and change { customer.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:customer) { create(:customer) }

    let(:instance) do
      CustomerResource.find(id: customer.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Customer.count }.by(-1)
    end
  end
end
