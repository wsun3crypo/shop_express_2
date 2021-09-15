require "rails_helper"

RSpec.describe "loyalty_programs#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/loyalty_programs", params: params
  end

  describe "basic fetch" do
    let!(:loyalty_program1) { create(:loyalty_program) }
    let!(:loyalty_program2) { create(:loyalty_program) }

    it "works" do
      expect(LoyaltyProgramResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["loyalty_programs"])
      expect(d.map(&:id)).to match_array([loyalty_program1.id,
                                          loyalty_program2.id])
    end
  end
end
