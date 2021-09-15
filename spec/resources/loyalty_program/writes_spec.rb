require "rails_helper"

RSpec.describe LoyaltyProgramResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "loyalty_programs",
          attributes: {},
        },
      }
    end

    let(:instance) do
      LoyaltyProgramResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { LoyaltyProgram.count }.by(1)
    end
  end

  describe "updating" do
    let!(:loyalty_program) { create(:loyalty_program) }

    let(:payload) do
      {
        data: {
          id: loyalty_program.id.to_s,
          type: "loyalty_programs",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      LoyaltyProgramResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { loyalty_program.reload.updated_at }
      # .and change { loyalty_program.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:loyalty_program) { create(:loyalty_program) }

    let(:instance) do
      LoyaltyProgramResource.find(id: loyalty_program.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { LoyaltyProgram.count }.by(-1)
    end
  end
end
