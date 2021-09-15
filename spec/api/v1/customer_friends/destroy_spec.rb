require "rails_helper"

RSpec.describe "customer_friends#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/customer_friends/#{customer_friend.id}"
  end

  describe "basic destroy" do
    let!(:customer_friend) { create(:customer_friend) }

    it "updates the resource" do
      expect(CustomerFriendResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { CustomerFriend.count }.by(-1)
      expect { customer_friend.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
