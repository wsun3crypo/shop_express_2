class MerchantPartnershipsController < ApplicationController
  before_action :set_merchant_partnership, only: [:show, :edit, :update, :destroy]

  # GET /merchant_partnerships
  def index
    @merchant_partnerships = MerchantPartnership.page(params[:page]).per(10)
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
      message = 'MerchantPartnership was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @merchant_partnership, notice: message
      end
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
    message = "MerchantPartnership was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to merchant_partnerships_url, notice: message
    end
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
