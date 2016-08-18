class Cp::SubscribersController < Cp::AdminsController
  before_action :set_cp_subscriber, only: [:show, :edit, :update, :destroy]

  # GET /cp/subscribers
  # GET /cp/subscribers.json
  def index
    @cp_subscribers = Subscriber.all
  end

  # GET /cp/subscribers/1
  # GET /cp/subscribers/1.json
  def show
  end

  # GET /cp/subscribers/new
  def new
    @cp_subscriber = Subscriber.new
  end

  # GET /cp/subscribers/1/edit
  def edit
  end

  # POST /cp/subscribers
  # POST /cp/subscribers.json
  def create
    @cp_subscriber = Subscriber.new(cp_subscriber_params)

    respond_to do |format|
      if @cp_subscriber.save
        format.html { redirect_to cp_subscriber_path(@cp_subscriber), notice: 'Subscriber was successfully created.' }
        format.json { render :show, status: :created, location: @cp_subscriber }
      else
        format.html { render :new }
        format.json { render json: @cp_subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cp/subscribers/1
  # PATCH/PUT /cp/subscribers/1.json
  def update
    respond_to do |format|
      if @cp_subscriber.update(cp_subscriber_params)
        format.html { redirect_to cp_subscriber_path(@cp_subscriber), notice: 'Subscriber was successfully updated.' }
        format.json { render :show, status: :ok, location: @cp_subscriber }
      else
        format.html { render :edit }
        format.json { render json: @cp_subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cp/subscribers/1
  # DELETE /cp/subscribers/1.json
  def destroy
    @cp_subscriber.destroy
    respond_to do |format|
      format.html { redirect_to cp_subscribers_url, notice: 'Subscriber was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cp_subscriber
      @cp_subscriber = Subscriber.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cp_subscriber_params
      params.require(:subscriber).permit(:email, :active)
    end
end
