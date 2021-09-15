class ProductReviewsController < ApplicationController
  before_action :set_product_review, only: [:show, :edit, :update, :destroy]

  # GET /product_reviews
  def index
    @product_reviews = ProductReview.all
  end

  # GET /product_reviews/1
  def show
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
      redirect_to @product_review, notice: 'Product review was successfully created.'
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
    redirect_to product_reviews_url, notice: 'Product review was successfully destroyed.'
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
