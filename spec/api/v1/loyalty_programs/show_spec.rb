require 'rails_helper'

RSpec.describe "loyalty_programs#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/loyalty_programs/#{loyalty_program.id}", params: params
  end

  describe 'basic fetch' do
    let!(:loyalty_program) { create(:loyalty_program) }

    it 'works' do
      expect(LoyaltyProgramResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('loyalty_programs')
      expect(d.id).to eq(loyalty_program.id)
    end
  end
end
