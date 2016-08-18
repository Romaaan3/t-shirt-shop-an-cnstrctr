class Cp::RequestsController < Cp::AdminsController
  before_action :set_cp_request, only: [:show, :edit, :update, :destroy]

  # GET /cp/requests
  # GET /cp/requests.json
  def index
    @cp_requests = Request.paginate(:page => params[:page], :per_page => 10).order('id DESC')
        @title = "Запросы"

  end

  # GET /cp/requests/1
  # GET /cp/requests/1.json
  def show
  end

  # GET /cp/requests/new
  def new
    @cp_request = Request.new
  end

  # GET /cp/requests/1/edit
  def edit
  end

  # POST /cp/requests
  # POST /cp/requests.json
  def create
    @cp_request = Request.new(cp_request_params)

    respond_to do |format|
      if @cp_request.save
        format.html { redirect_to cp_request_path(@cp_request), notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @cp_request }
      else
        format.html { render :new }
        format.json { render json: @cp_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cp/requests/1
  # PATCH/PUT /cp/requests/1.json
  def update
    respond_to do |format|
      if @cp_request.update(cp_request_params)
        format.html { redirect_to cp_request_path(@cp_request), notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @cp_request }
      else
        format.html { render :edit }
        format.json { render json: @cp_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cp/requests/1
  # DELETE /cp/requests/1.json
  def destroy
    @cp_request.destroy
    respond_to do |format|
      format.html { redirect_to cp_requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cp_request
      @cp_request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cp_request_params
      params.require(:request).permit(:name, :email, :comment)
    end
end
