require "rails_helper"

RSpec.describe PurchasedProductResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "purchased_products",
          attributes: {},
        },
      }
    end

    let(:instance) do
      PurchasedProductResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { PurchasedProduct.count }.by(1)
    end
  end

  describe "updating" do
    let!(:purchased_product) { create(:purchased_product) }

    let(:payload) do
      {
        data: {
          id: purchased_product.id.to_s,
          type: "purchased_products",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      PurchasedProductResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { purchased_product.reload.updated_at }
      # .and change { purchased_product.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:purchased_product) { create(:purchased_product) }

    let(:instance) do
      PurchasedProductResource.find(id: purchased_product.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { PurchasedProduct.count }.by(-1)
    end
  end
end
