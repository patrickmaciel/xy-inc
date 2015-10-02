class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
    respond_with @products
  end

  # GET /products/1
  # GET /products/1.json
  def show
    respond_with @product
  end

  # GET /products/new
  def new
    @product = Product.new
    respond_with @product
  end

  # GET /products/1/edit
  def edit
    respond_with @product
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    flash[:notice] = 'Product was successfully created.' if @product.save
    respond_with @product
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    flash[:notice] = 'Product was successfully updated.' if @product.update(product_params)
    respond_with @product
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    flash[:notice] = 'Product was successfully destroyed.' if @product.destroy
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :category)
  end
end