require "rails_helper"

RSpec.describe "customer_friends#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/customer_friends", params: params
  end

  describe "basic fetch" do
    let!(:customer_friend1) { create(:customer_friend) }
    let!(:customer_friend2) { create(:customer_friend) }

    it "works" do
      expect(CustomerFriendResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["customer_friends"])
      expect(d.map(&:id)).to match_array([customer_friend1.id,
                                          customer_friend2.id])
    end
  end
end
