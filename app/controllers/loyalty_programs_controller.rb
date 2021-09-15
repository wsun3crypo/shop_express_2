class LoyaltyProgramsController < ApplicationController
  before_action :set_loyalty_program, only: [:show, :edit, :update, :destroy]

  # GET /loyalty_programs
  def index
    @loyalty_programs = LoyaltyProgram.all
  end

  # GET /loyalty_programs/1
  def show
  end

  # GET /loyalty_programs/new
  def new
    @loyalty_program = LoyaltyProgram.new
  end

  # GET /loyalty_programs/1/edit
  def edit
  end

  # POST /loyalty_programs
  def create
    @loyalty_program = LoyaltyProgram.new(loyalty_program_params)

    if @loyalty_program.save
      redirect_to @loyalty_program, notice: 'Loyalty program was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /loyalty_programs/1
  def update
    if @loyalty_program.update(loyalty_program_params)
      redirect_to @loyalty_program, notice: 'Loyalty program was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /loyalty_programs/1
  def destroy
    @loyalty_program.destroy
    message = "LoyaltyProgram was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to loyalty_programs_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loyalty_program
      @loyalty_program = LoyaltyProgram.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def loyalty_program_params
      params.require(:loyalty_program).permit(:merchants_id, :customers_id)
    end
end
