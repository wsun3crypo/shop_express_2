class Api::V1::LoyaltyProgramsController < Api::V1::GraphitiController
  def index
    loyalty_programs = LoyaltyProgramResource.all(params)
    respond_with(loyalty_programs)
  end

  def show
    loyalty_program = LoyaltyProgramResource.find(params)
    respond_with(loyalty_program)
  end

  def create
    loyalty_program = LoyaltyProgramResource.build(params)

    if loyalty_program.save
      render jsonapi: loyalty_program, status: :created
    else
      render jsonapi_errors: loyalty_program
    end
  end

  def update
    loyalty_program = LoyaltyProgramResource.find(params)

    if loyalty_program.update_attributes
      render jsonapi: loyalty_program
    else
      render jsonapi_errors: loyalty_program
    end
  end

  def destroy
    loyalty_program = LoyaltyProgramResource.find(params)

    if loyalty_program.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: loyalty_program
    end
  end
end
