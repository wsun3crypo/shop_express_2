class Api::V1::CustomerFriendsController < Api::V1::GraphitiController
  def index
    customer_friends = CustomerFriendResource.all(params)
    respond_with(customer_friends)
  end

  def show
    customer_friend = CustomerFriendResource.find(params)
    respond_with(customer_friend)
  end

  def create
    customer_friend = CustomerFriendResource.build(params)

    if customer_friend.save
      render jsonapi: customer_friend, status: 201
    else
      render jsonapi_errors: customer_friend
    end
  end

  def update
    customer_friend = CustomerFriendResource.find(params)

    if customer_friend.update_attributes
      render jsonapi: customer_friend
    else
      render jsonapi_errors: customer_friend
    end
  end

  def destroy
    customer_friend = CustomerFriendResource.find(params)

    if customer_friend.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: customer_friend
    end
  end
end
