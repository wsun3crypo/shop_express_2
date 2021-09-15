require 'rails_helper'

RSpec.describe "loyalty_programs#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/loyalty_programs/#{loyalty_program.id}", payload
  end

  describe 'basic update' do
    let!(:loyalty_program) { create(:loyalty_program) }

    let(:payload) do
      {
        data: {
          id: loyalty_program.id.to_s,
          type: 'loyalty_programs',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(LoyaltyProgramResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { loyalty_program.reload.attributes }
    end
  end
end
