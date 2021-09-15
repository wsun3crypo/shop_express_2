class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show edit update destroy]

  def index
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
    @product_review = ProductReview.new
    @assigned_coupon = AssignedCoupon.new
    @customer_friend = CustomerFriend.new
    @loyalty_program = LoyaltyProgram.new
    @purchased_product = PurchasedProduct.new
  end

  def new
    @customer = Customer.new
  end

  def edit; end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to @customer, notice: "Customer was successfully created."
    else
      render :new
    end
  end

  def update
    if @customer.update(customer_params)
      redirect_to @customer, notice: "Customer was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_url, notice: "Customer was successfully destroyed."
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.fetch(:customer, {})
  end
end
