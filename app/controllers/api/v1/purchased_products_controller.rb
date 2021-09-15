class Api::V1::PurchasedProductsController < Api::V1::GraphitiController
  def index
    purchased_products = PurchasedProductResource.all(params)
    respond_with(purchased_products)
  end

  def show
    purchased_product = PurchasedProductResource.find(params)
    respond_with(purchased_product)
  end

  def create
    purchased_product = PurchasedProductResource.build(params)

    if purchased_product.save
      render jsonapi: purchased_product, status: :created
    else
      render jsonapi_errors: purchased_product
    end
  end

  def update
    purchased_product = PurchasedProductResource.find(params)

    if purchased_product.update_attributes
      render jsonapi: purchased_product
    else
      render jsonapi_errors: purchased_product
    end
  end

  def destroy
    purchased_product = PurchasedProductResource.find(params)

    if purchased_product.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: purchased_product
    end
  end
end
