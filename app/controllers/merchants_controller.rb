class MerchantsController < ApplicationController
  before_action :set_merchant, only: [:show, :edit, :update, :destroy]

  # GET /merchants
  def index
    @merchants = Merchant.all
  end

  # GET /merchants/1
  def show
    @merchant_partnership = MerchantPartnership.new
    @loyalty_program = LoyaltyProgram.new
    @product = Product.new
    @coupon = Coupon.new
  end

  # GET /merchants/new
  def new
    @merchant = Merchant.new
  end

  # GET /merchants/1/edit
  def edit
  end

  # POST /merchants
  def create
    @merchant = Merchant.new(merchant_params)

    if @merchant.save
      redirect_to @merchant, notice: 'Merchant was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /merchants/1
  def update
    if @merchant.update(merchant_params)
      redirect_to @merchant, notice: 'Merchant was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /merchants/1
  def destroy
    @merchant.destroy
    redirect_to merchants_url, notice: 'Merchant was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merchant
      @merchant = Merchant.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def merchant_params
      params.require(:merchant).permit(:name, :description, :address, :tel, :picture)
    end
end
