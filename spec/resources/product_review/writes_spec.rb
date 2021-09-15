require "rails_helper"

RSpec.describe ProductReviewResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "product_reviews",
          attributes: {},
        },
      }
    end

    let(:instance) do
      ProductReviewResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { ProductReview.count }.by(1)
    end
  end

  describe "updating" do
    let!(:product_review) { create(:product_review) }

    let(:payload) do
      {
        data: {
          id: product_review.id.to_s,
          type: "product_reviews",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      ProductReviewResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { product_review.reload.updated_at }
      # .and change { product_review.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:product_review) { create(:product_review) }

    let(:instance) do
      ProductReviewResource.find(id: product_review.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { ProductReview.count }.by(-1)
    end
  end
end
