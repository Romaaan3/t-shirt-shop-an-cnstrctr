class Cp::ProductsController < Cp::AdminsController
  before_action :set_cp_product, only: [:show, :edit, :update, :destroy]

  # GET /cp/products
  # GET /cp/products.json
  def index
    @cp_products = Product.paginate(:page => params[:page], :per_page => 10).order('id DESC')
        @title = "Майки"

  end

  # GET /cp/products/1
  # GET /cp/products/1.json
  def show
  end

  # GET /cp/products/new
  def new
    @cp_product = Product.new
  end

  # GET /cp/products/1/edit
  def edit
  end

  # POST /cp/products
  # POST /cp/products.json
  def create
    @cp_product = Product.new(cp_product_params)

    respond_to do |format|
      if @cp_product.save
        format.html { redirect_to cp_product_url(@cp_product), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @cp_product }
      else
        format.html { render :new }
        format.json { render json: @cp_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cp/products/1
  # PATCH/PUT /cp/products/1.json
  def update
    respond_to do |format|
      if @cp_product.update(cp_product_params)
        format.html { redirect_to cp_product_url(@cp_product), notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @cp_product }
      else
        format.html { render :edit }
        format.json { render json: @cp_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cp/products/1
  # DELETE /cp/products/1.json
  def destroy
    @cp_product.destroy
    respond_to do |format|
      format.html { redirect_to cp_products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cp_product
      @cp_product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cp_product_params
      params.require(:product).permit(:name, :description, :type, :photo)
    end
end
