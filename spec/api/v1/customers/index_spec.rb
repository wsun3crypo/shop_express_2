require "rails_helper"

RSpec.describe "customers#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/customers", params: params
  end

  describe "basic fetch" do
    let!(:customer1) { create(:customer) }
    let!(:customer2) { create(:customer) }

    it "works" do
      expect(CustomerResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["customers"])
      expect(d.map(&:id)).to match_array([customer1.id, customer2.id])
    end
  end
end
