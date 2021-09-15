require 'rails_helper'

RSpec.describe "customers#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/customers/#{customer.id}", payload
  end

  describe 'basic update' do
    let!(:customer) { create(:customer) }

    let(:payload) do
      {
        data: {
          id: customer.id.to_s,
          type: 'customers',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(CustomerResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { customer.reload.attributes }
    end
  end
end
