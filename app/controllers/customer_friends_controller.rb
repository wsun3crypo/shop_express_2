class CustomerFriendsController < ApplicationController
  before_action :set_customer_friend, only: [:show, :edit, :update, :destroy]

  # GET /customer_friends
  def index
    @customer_friends = CustomerFriend.all
  end

  # GET /customer_friends/1
  def show
  end

  # GET /customer_friends/new
  def new
    @customer_friend = CustomerFriend.new
  end

  # GET /customer_friends/1/edit
  def edit
  end

  # POST /customer_friends
  def create
    @customer_friend = CustomerFriend.new(customer_friend_params)

    if @customer_friend.save
      message = 'CustomerFriend was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @customer_friend, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /customer_friends/1
  def update
    if @customer_friend.update(customer_friend_params)
      redirect_to @customer_friend, notice: 'Customer friend was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /customer_friends/1
  def destroy
    @customer_friend.destroy
    message = "CustomerFriend was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to customer_friends_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_friend
      @customer_friend = CustomerFriend.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def customer_friend_params
      params.require(:customer_friend).permit(:sender_id, :receiver_id)
    end
end
