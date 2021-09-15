require "rails_helper"

RSpec.describe "customer_friends#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/customer_friends/#{customer_friend.id}", params: params
  end

  describe "basic fetch" do
    let!(:customer_friend) { create(:customer_friend) }

    it "works" do
      expect(CustomerFriendResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("customer_friends")
      expect(d.id).to eq(customer_friend.id)
    end
  end
end
