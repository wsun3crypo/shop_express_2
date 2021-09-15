require 'rails_helper'

RSpec.describe "customers#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/customers/#{customer.id}", params: params
  end

  describe 'basic fetch' do
    let!(:customer) { create(:customer) }

    it 'works' do
      expect(CustomerResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('customers')
      expect(d.id).to eq(customer.id)
    end
  end
end
