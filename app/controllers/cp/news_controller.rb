class Cp::NewsController < Cp::AdminsController
  before_action :set_cp_news, only: [:show, :edit, :update, :destroy]

  # GET /cp/news
  # GET /cp/news.json
  def index
    @cp_news = News.paginate(:page => params[:page], :per_page => 10).order('id DESC')
        @title = "Новости"

  end

  # GET /cp/news/1
  # GET /cp/news/1.json
  def show
  end

  # GET /cp/news/new
  def new
    @cp_news = News.new
  end

  # GET /cp/news/1/edit
  def edit
  end

  # POST /cp/news
  # POST /cp/news.json
  def create
    @cp_news = News.new(cp_news_params)

    respond_to do |format|
      if @cp_news.save
        format.html { redirect_to cp_news_path(@cp_news), notice: 'News was successfully created.' }
        @subscribers = Subscriber.all
        @subscribers.each do |s|
          if s.active == true
        UserMailer.send_to_subscribers(s, @cp_news).deliver_now
      end
        end
        format.json { render :show, status: :created, location: @cp_news }
      else
        format.html { render :new }
        format.json { render json: @cp_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cp/news/1
  # PATCH/PUT /cp/news/1.json
  def update
    respond_to do |format|
      if @cp_news.update(cp_news_params)
        format.html { redirect_to cp_news_path(@cp_news), notice: 'News was successfully updated.' }
        format.json { render :show, status: :ok, location: @cp_news }
      else
        format.html { render :edit }
        format.json { render json: @cp_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cp/news/1
  # DELETE /cp/news/1.json
  def destroy
    @cp_news.destroy
    respond_to do |format|
      format.html { redirect_to cp_news_index_url, notice: 'News was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cp_news
      @cp_news = News.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cp_news_params
      params.require(:news).permit(:title, :description, :anons, :main_photo)
    end
end
