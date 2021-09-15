class Api::V1::ProductsController < Api::V1::GraphitiController
  def index
    products = ProductResource.all(params)
    respond_with(products)
  end

  def show
    product = ProductResource.find(params)
    respond_with(product)
  end

  def create
    product = ProductResource.build(params)

    if product.save
      render jsonapi: product, status: :created
    else
      render jsonapi_errors: product
    end
  end

  def update
    product = ProductResource.find(params)

    if product.update_attributes
      render jsonapi: product
    else
      render jsonapi_errors: product
    end
  end

  def destroy
    product = ProductResource.find(params)

    if product.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: product
    end
  end
end
