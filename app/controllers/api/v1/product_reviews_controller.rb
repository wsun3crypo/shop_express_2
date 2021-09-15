class Api::V1::ProductReviewsController < Api::V1::GraphitiController
  def index
    product_reviews = ProductReviewResource.all(params)
    respond_with(product_reviews)
  end

  def show
    product_review = ProductReviewResource.find(params)
    respond_with(product_review)
  end

  def create
    product_review = ProductReviewResource.build(params)

    if product_review.save
      render jsonapi: product_review, status: :created
    else
      render jsonapi_errors: product_review
    end
  end

  def update
    product_review = ProductReviewResource.find(params)

    if product_review.update_attributes
      render jsonapi: product_review
    else
      render jsonapi_errors: product_review
    end
  end

  def destroy
    product_review = ProductReviewResource.find(params)

    if product_review.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: product_review
    end
  end
end
