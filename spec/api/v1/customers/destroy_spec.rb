require 'rails_helper'

RSpec.describe "customers#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/customers/#{customer.id}"
  end

  describe 'basic destroy' do
    let!(:customer) { create(:customer) }

    it 'updates the resource' do
      expect(CustomerResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Customer.count }.by(-1)
      expect { customer.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
