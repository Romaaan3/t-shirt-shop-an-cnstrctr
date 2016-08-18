class ImagesController < Cp::AdminsController
  before_action :set_cp_image, only: [:show, :edit, :update, :destroy]

  # GET /cp/images
  # GET /cp/images.json
  def index
    @cp_images = Image.all
  end

  # GET /cp/images/1
  # GET /cp/images/1.json
  def show
  end

  # GET /cp/images/new
  def new
    @cp_image = Image.new
  end

  # GET /cp/images/1/edit
  def edit
  end

  # POST /cp/images
  # POST /cp/images.json
  def create
    @cp_image = Image.new(cp_image_params)

    respond_to do |format|
      if @cp_image.save
        format.html { redirect_to @cp_image, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @cp_image }
      else
        format.html { render :new }
        format.json { render json: @cp_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cp/images/1
  # PATCH/PUT /cp/images/1.json
  def update
    respond_to do |format|
      if @cp_image.update(cp_image_params)
        format.html { redirect_to @cp_image, notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @cp_image }
      else
        format.html { render :edit }
        format.json { render json: @cp_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cp/images/1
  # DELETE /cp/images/1.json
  def destroy
    @cp_image.destroy
    respond_to do |format|
      format.html { redirect_to cp_images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cp_image
      @cp_image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cp_image_params
      params.require(:cp_image).permit(:order_id)
    end
end
