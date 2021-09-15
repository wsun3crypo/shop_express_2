require "rails_helper"

RSpec.describe "loyalty_programs#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/loyalty_programs/#{loyalty_program.id}"
  end

  describe "basic destroy" do
    let!(:loyalty_program) { create(:loyalty_program) }

    it "updates the resource" do
      expect(LoyaltyProgramResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { LoyaltyProgram.count }.by(-1)
      expect { loyalty_program.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
