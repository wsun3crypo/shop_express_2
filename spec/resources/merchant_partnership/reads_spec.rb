require "rails_helper"

RSpec.describe MerchantPartnershipResource, type: :resource do
  describe "serialization" do
    let!(:merchant_partnership) { create(:merchant_partnership) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(merchant_partnership.id)
      expect(data.jsonapi_type).to eq("merchant_partnerships")
    end
  end

  describe "filtering" do
    let!(:merchant_partnership1) { create(:merchant_partnership) }
    let!(:merchant_partnership2) { create(:merchant_partnership) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: merchant_partnership2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([merchant_partnership2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:merchant_partnership1) { create(:merchant_partnership) }
      let!(:merchant_partnership2) { create(:merchant_partnership) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      merchant_partnership1.id,
                                      merchant_partnership2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      merchant_partnership2.id,
                                      merchant_partnership1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
