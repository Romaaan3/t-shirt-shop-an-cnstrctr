class Cp::NewsPhotosController < Cp::AdminsController
  before_action :set_cp_news_photo, only: [:show, :edit, :update, :destroy]

  # GET /cp/news_photos
  # GET /cp/news_photos.json
  def index
    @cp_news_photos = NewsPhoto.all
  end

  # GET /cp/news_photos/1
  # GET /cp/news_photos/1.json
  def show
  end

  # GET /cp/news_photos/new
  def new
    @cp_news_photo = NewsPhoto.new
  end

  # GET /cp/news_photos/1/edit
  def edit
  end

  # POST /cp/news_photos
  # POST /cp/news_photos.json
  def create
    @cp_news_photo = NewsPhoto.new(cp_news_photo_params)

    respond_to do |format|
      if @cp_news_photo.save
        format.html { redirect_to @cp_news_photo, notice: 'News photo was successfully created.' }
        format.json { render :show, status: :created, location: @cp_news_photo }
      else
        format.html { render :new }
        format.json { render json: @cp_news_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cp/news_photos/1
  # PATCH/PUT /cp/news_photos/1.json
  def update
    respond_to do |format|
      if @cp_news_photo.update(cp_news_photo_params)
        format.html { redirect_to @cp_news_photo, notice: 'News photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @cp_news_photo }
      else
        format.html { render :edit }
        format.json { render json: @cp_news_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cp/news_photos/1
  # DELETE /cp/news_photos/1.json
  def destroy
    @cp_news_photo.destroy
    respond_to do |format|
      format.html { redirect_to cp_news_photos_url, notice: 'News photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cp_news_photo
      @cp_news_photo = NewsPhoto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cp_news_photo_params
      params.require(:news_photo).permit(:photo)
    end
end
