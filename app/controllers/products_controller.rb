class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(:distinct => true).includes(:merchants, :purchased_products).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@products.where.not(:picture_latitude => nil)) do |product, marker|
      marker.lat product.picture_latitude
      marker.lng product.picture_longitude
      marker.infowindow "<h5><a href='/products/#{product.id}'>#{product.merchants_id}</a></h5><small>#{product.picture_formatted_address}</small>"
    end
  end

  # GET /products/1
  def show
    @purchased_product = PurchasedProduct.new
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      message = 'Product was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @product, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    message = "Product was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to products_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:merchants_id, :description, :picture, :price)
    end
end
