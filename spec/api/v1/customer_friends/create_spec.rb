require 'rails_helper'

RSpec.describe "customer_friends#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/customer_friends", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'customer_friends',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(CustomerFriendResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { CustomerFriend.count }.by(1)
    end
  end
end
