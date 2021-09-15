class MerchantPartnershipsController < ApplicationController
  before_action :set_merchant_partnership,
                only: %i[show edit update destroy]

  def index
    @q = MerchantPartnership.ransack(params[:q])
    @merchant_partnerships = @q.result(distinct: true).includes(:sender,
                                                                :receiver).page(params[:page]).per(10)
  end

  def show; end

  def new
    @merchant_partnership = MerchantPartnership.new
  end

  def edit; end

  def create
    @merchant_partnership = MerchantPartnership.new(merchant_partnership_params)

    if @merchant_partnership.save
      message = "MerchantPartnership was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @merchant_partnership, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @merchant_partnership.update(merchant_partnership_params)
      redirect_to @merchant_partnership,
                  notice: "Merchant partnership was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @merchant_partnership.destroy
    message = "MerchantPartnership was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to merchant_partnerships_url, notice: message
    end
  end

  private

  def set_merchant_partnership
    @merchant_partnership = MerchantPartnership.find(params[:id])
  end

  def merchant_partnership_params
    params.require(:merchant_partnership).permit(:sender_id, :receiver_id)
  end
end
