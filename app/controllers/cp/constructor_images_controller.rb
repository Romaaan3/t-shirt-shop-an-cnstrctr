class Cp::ConstructorImagesController < Cp::AdminsController
  before_action :set_cp_constructor_image, only: [:show, :edit, :update, :destroy]

  # GET /cp/constructor_images
  # GET /cp/constructor_images.json
  def index
    @cp_constructor_images = ConstructorImage.paginate(:page => params[:page], :per_page => 10).order('id DESC')
    @title = "Изображения"
  end

  # GET /cp/constructor_images/1
  # GET /cp/constructor_images/1.json
  def show
  end

  # GET /cp/constructor_images/new
  def new
    @cp_constructor_image = ConstructorImage.new
  end

  # GET /cp/constructor_images/1/edit
  def edit
  end

  # POST /cp/constructor_images
  # POST /cp/constructor_images.json
  def create
    @cp_constructor_image = ConstructorImage.new(cp_constructor_image_params)

    respond_to do |format|
      if @cp_constructor_image.save
        format.html { redirect_to cp_constructor_image_path(@cp_constructor_image), notice: 'Constructor image was successfully created.' }
        format.json { render :show, status: :created, location: @cp_constructor_image }
      else
        format.html { render :new }
        format.json { render json: @cp_constructor_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cp/constructor_images/1
  # PATCH/PUT /cp/constructor_images/1.json
  def update
    respond_to do |format|
      if @cp_constructor_image.update(cp_constructor_image_params)
        format.html { redirect_to cp_constructor_image_path(@cp_constructor_image), notice: 'Constructor image was successfully updated.' }
        format.json { render :show, status: :ok, location: @cp_constructor_image }
      else
        format.html { render :edit }
        format.json { render json: @cp_constructor_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cp/constructor_images/1
  # DELETE /cp/constructor_images/1.json
  def destroy
    @cp_constructor_image.destroy
    respond_to do |format|
      format.html { redirect_to cp_constructor_images_url, notice: 'Constructor image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cp_constructor_image
      @cp_constructor_image = ConstructorImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cp_constructor_image_params
      params.require(:constructor_image).permit(:img)
    end
end
