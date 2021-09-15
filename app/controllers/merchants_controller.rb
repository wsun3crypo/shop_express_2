class MerchantsController < ApplicationController
  before_action :set_merchant, only: %i[show edit update destroy]

  def index
    @merchants = Merchant.page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@merchants.where.not(picture_latitude: nil)) do |merchant, marker|
      marker.lat merchant.picture_latitude
      marker.lng merchant.picture_longitude
    end
  end

  def show
    @merchant_partnership = MerchantPartnership.new
    @loyalty_program = LoyaltyProgram.new
    @product = Product.new
    @coupon = Coupon.new
  end

  def new
    @merchant = Merchant.new
  end

  def edit; end

  def create
    @merchant = Merchant.new(merchant_params)

    if @merchant.save
      redirect_to @merchant, notice: "Merchant was successfully created."
    else
      render :new
    end
  end

  def update
    if @merchant.update(merchant_params)
      redirect_to @merchant, notice: "Merchant was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @merchant.destroy
    redirect_to merchants_url, notice: "Merchant was successfully destroyed."
  end

  private

  def set_merchant
    @merchant = Merchant.find(params[:id])
  end

  def merchant_params
    params.require(:merchant).permit(:name, :description, :address, :tel,
                                     :picture)
  end
end
