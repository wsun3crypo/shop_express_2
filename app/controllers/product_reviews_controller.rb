class ProductReviewsController < ApplicationController
  before_action :set_product_review, only: %i[show edit update destroy]

  def index
    @q = ProductReview.ransack(params[:q])
    @product_reviews = @q.result(distinct: true).includes(:customers,
                                                          :purchased_products).page(params[:page]).per(10)
  end

  def show
    @purchased_product = PurchasedProduct.new
  end

  def new
    @product_review = ProductReview.new
  end

  def edit; end

  def create
    @product_review = ProductReview.new(product_review_params)

    if @product_review.save
      message = "ProductReview was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @product_review, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @product_review.update(product_review_params)
      redirect_to @product_review,
                  notice: "Product review was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @product_review.destroy
    message = "ProductReview was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to product_reviews_url, notice: message
    end
  end

  private

  def set_product_review
    @product_review = ProductReview.find(params[:id])
  end

  def product_review_params
    params.require(:product_review).permit(:review, :customers_id)
  end
end
