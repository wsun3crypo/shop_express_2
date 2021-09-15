require "rails_helper"

RSpec.describe "customer_friends#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/customer_friends/#{customer_friend.id}", payload
  end

  describe "basic update" do
    let!(:customer_friend) { create(:customer_friend) }

    let(:payload) do
      {
        data: {
          id: customer_friend.id.to_s,
          type: "customer_friends",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(CustomerFriendResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { customer_friend.reload.attributes }
    end
  end
end
