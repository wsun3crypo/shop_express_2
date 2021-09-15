class ProductReviewsController < ApplicationController
  before_action :set_product_review, only: [:show, :edit, :update, :destroy]

  # GET /product_reviews
  def index
    @q = ProductReview.ransack(params[:q])
    @product_reviews = @q.result(:distinct => true).includes(:customers, :purchased_products).page(params[:page]).per(10)
  end

  # GET /product_reviews/1
  def show
    @purchased_product = PurchasedProduct.new
  end

  # GET /product_reviews/new
  def new
    @product_review = ProductReview.new
  end

  # GET /product_reviews/1/edit
  def edit
  end

  # POST /product_reviews
  def create
    @product_review = ProductReview.new(product_review_params)

    if @product_review.save
      message = 'ProductReview was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @product_review, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /product_reviews/1
  def update
    if @product_review.update(product_review_params)
      redirect_to @product_review, notice: 'Product review was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /product_reviews/1
  def destroy
    @product_review.destroy
    message = "ProductReview was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to product_reviews_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_review
      @product_review = ProductReview.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_review_params
      params.require(:product_review).permit(:review, :customers_id)
    end
end
