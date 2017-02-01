class ProductController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret"
  #, except: [:index, :show]

  def new
  end

  def create
    @product = Product.new(product_params)
    params[:pic]&.each do |image|
      @product.product_images.build(image: image)
    end
    if @product.save 
     redirect_to '/product/products'
    else
     redirect_to '/product/new'
     flash[:error] = @product.errors.full_messages
    end
  end 

  def index
    @products = Product.all
  end 

  def delete
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to "/product/products"
  end 

  def show
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    product = product_params
    if params[:pic] && params[:pic].size > 0  #product image boşsa eski resmi getirmek için. unless if not demek.
      @product.product_images.replace(params[:pic].map do |image|
        @product.product_images.build(image: image)
      end)
    end
    @product.update_attributes(product)
    redirect_to products_url
  end 

 
  private
    def product_params
      {name: params[:txtname], price: params[:txtprice], description: params[:txtdesc]}
    end


end
