class Api::V1::CustomersController < Api::V1::GraphitiController
  def index
    customers = CustomerResource.all(params)
    respond_with(customers)
  end

  def show
    customer = CustomerResource.find(params)
    respond_with(customer)
  end

  def create
    customer = CustomerResource.build(params)

    if customer.save
      render jsonapi: customer, status: 201
    else
      render jsonapi_errors: customer
    end
  end

  def update
    customer = CustomerResource.find(params)

    if customer.update_attributes
      render jsonapi: customer
    else
      render jsonapi_errors: customer
    end
  end

  def destroy
    customer = CustomerResource.find(params)

    if customer.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: customer
    end
  end
end
