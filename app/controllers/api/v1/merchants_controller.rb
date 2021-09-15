class Api::V1::MerchantsController < Api::V1::GraphitiController
  def index
    merchants = MerchantResource.all(params)
    respond_with(merchants)
  end

  def show
    merchant = MerchantResource.find(params)
    respond_with(merchant)
  end

  def create
    merchant = MerchantResource.build(params)

    if merchant.save
      render jsonapi: merchant, status: 201
    else
      render jsonapi_errors: merchant
    end
  end

  def update
    merchant = MerchantResource.find(params)

    if merchant.update_attributes
      render jsonapi: merchant
    else
      render jsonapi_errors: merchant
    end
  end

  def destroy
    merchant = MerchantResource.find(params)

    if merchant.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: merchant
    end
  end
end
