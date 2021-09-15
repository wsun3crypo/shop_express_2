class MerchantPartnershipsController < ApplicationController
  before_action :set_merchant_partnership, only: [:show, :edit, :update, :destroy]

  # GET /merchant_partnerships
  def index
    @merchant_partnerships = MerchantPartnership.all
  end

  # GET /merchant_partnerships/1
  def show
  end

  # GET /merchant_partnerships/new
  def new
    @merchant_partnership = MerchantPartnership.new
  end

  # GET /merchant_partnerships/1/edit
  def edit
  end

  # POST /merchant_partnerships
  def create
    @merchant_partnership = MerchantPartnership.new(merchant_partnership_params)

    if @merchant_partnership.save
      redirect_to @merchant_partnership, notice: 'Merchant partnership was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /merchant_partnerships/1
  def update
    if @merchant_partnership.update(merchant_partnership_params)
      redirect_to @merchant_partnership, notice: 'Merchant partnership was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /merchant_partnerships/1
  def destroy
    @merchant_partnership.destroy
    redirect_to merchant_partnerships_url, notice: 'Merchant partnership was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merchant_partnership
      @merchant_partnership = MerchantPartnership.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def merchant_partnership_params
      params.require(:merchant_partnership).permit(:sender_id, :receiver_id)
    end
end
