class LoyaltyProgramsController < ApplicationController
  before_action :set_loyalty_program, only: %i[show edit update destroy]

  def index
    @q = LoyaltyProgram.ransack(params[:q])
    @loyalty_programs = @q.result(distinct: true).includes(:merchants,
                                                           :customers, :purchased_products).page(params[:page]).per(10)
  end

  def show
    @purchased_product = PurchasedProduct.new
  end

  def new
    @loyalty_program = LoyaltyProgram.new
  end

  def edit; end

  def create
    @loyalty_program = LoyaltyProgram.new(loyalty_program_params)

    if @loyalty_program.save
      message = "LoyaltyProgram was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @loyalty_program, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @loyalty_program.update(loyalty_program_params)
      redirect_to @loyalty_program,
                  notice: "Loyalty program was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @loyalty_program.destroy
    message = "LoyaltyProgram was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to loyalty_programs_url, notice: message
    end
  end

  private

  def set_loyalty_program
    @loyalty_program = LoyaltyProgram.find(params[:id])
  end

  def loyalty_program_params
    params.require(:loyalty_program).permit(:merchants_id, :customers_id)
  end
end
