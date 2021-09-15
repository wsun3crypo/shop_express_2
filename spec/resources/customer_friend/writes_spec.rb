require 'rails_helper'

RSpec.describe CustomerFriendResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'customer_friends',
          attributes: { }
        }
      }
    end

    let(:instance) do
      CustomerFriendResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { CustomerFriend.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:customer_friend) { create(:customer_friend) }

    let(:payload) do
      {
        data: {
          id: customer_friend.id.to_s,
          type: 'customer_friends',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      CustomerFriendResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { customer_friend.reload.updated_at }
      # .and change { customer_friend.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:customer_friend) { create(:customer_friend) }

    let(:instance) do
      CustomerFriendResource.find(id: customer_friend.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { CustomerFriend.count }.by(-1)
    end
  end
end
