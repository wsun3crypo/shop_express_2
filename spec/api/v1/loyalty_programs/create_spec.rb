require "rails_helper"

RSpec.describe "loyalty_programs#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/loyalty_programs", payload
  end

  describe "basic create" do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: "loyalty_programs",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(LoyaltyProgramResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { LoyaltyProgram.count }.by(1)
    end
  end
end
