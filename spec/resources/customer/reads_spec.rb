require "rails_helper"

RSpec.describe CustomerResource, type: :resource do
  describe "serialization" do
    let!(:customer) { create(:customer) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(customer.id)
      expect(data.jsonapi_type).to eq("customers")
    end
  end

  describe "filtering" do
    let!(:customer1) { create(:customer) }
    let!(:customer2) { create(:customer) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: customer2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([customer2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:customer1) { create(:customer) }
      let!(:customer2) { create(:customer) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      customer1.id,
                                      customer2.id,
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
                                      customer2.id,
                                      customer1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
