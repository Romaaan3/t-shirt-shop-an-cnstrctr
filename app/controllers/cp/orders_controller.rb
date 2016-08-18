class Cp::OrdersController < Cp::AdminsController
  before_action :set_cp_order, only: [:show, :edit, :update, :destroy]

  # GET /cp/orders
  # GET /cp/orders.json
  def index
    @cp_orders = Order.paginate(:page => params[:page], :per_page => 10).order('id DESC')
        @title = "Заказы"
  end

  # GET /cp/orders/1
  # GET /cp/orders/1.json
  def show
  end

  # GET /cp/orders/new
  def new
    @cp_order = Order.new
  end

  # GET /cp/orders/1/edit
  def edit
  end

  # POST /cp/orders
  # POST /cp/orders.json
  def create
    @cp_order = Order.new(cp_order_params)

    respond_to do |format|
      if @cp_order.save
        format.html { redirect_to cp_order_path(@cp_order), notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @cp_order }
      else
        format.html { render :new }
        format.json { render json: @cp_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cp/orders/1
  # PATCH/PUT /cp/orders/1.json
  def update
    respond_to do |format|
      if @cp_order.update(cp_order_params)
        format.html { redirect_to cp_order_path(@cp_order), notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @cp_order }
      else
        format.html { render :edit }
        format.json { render json: @cp_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cp/orders/1
  # DELETE /cp/orders/1.json
  def destroy
    @cp_order.destroy
    respond_to do |format|
      format.html { redirect_to cp_orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cp_order
      @cp_order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cp_order_params
      params.require(:order).permit(:name, :mobile, :email, :comment)
    end
end
