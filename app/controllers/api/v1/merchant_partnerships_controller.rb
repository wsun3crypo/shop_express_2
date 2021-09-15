class Api::V1::MerchantPartnershipsController < Api::V1::GraphitiController
  def index
    merchant_partnerships = MerchantPartnershipResource.all(params)
    respond_with(merchant_partnerships)
  end

  def show
    merchant_partnership = MerchantPartnershipResource.find(params)
    respond_with(merchant_partnership)
  end

  def create
    merchant_partnership = MerchantPartnershipResource.build(params)

    if merchant_partnership.save
      render jsonapi: merchant_partnership, status: :created
    else
      render jsonapi_errors: merchant_partnership
    end
  end

  def update
    merchant_partnership = MerchantPartnershipResource.find(params)

    if merchant_partnership.update_attributes
      render jsonapi: merchant_partnership
    else
      render jsonapi_errors: merchant_partnership
    end
  end

  def destroy
    merchant_partnership = MerchantPartnershipResource.find(params)

    if merchant_partnership.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: merchant_partnership
    end
  end
end
