class Cp::ReviewsController < Cp::AdminsController
  before_action :set_cp_review, only: [:show, :edit, :update, :destroy, :activate, :deactivate]

  # GET /cp/reviews
  # GET /cp/reviews.json
  def index
    @cp_reviews = Review.paginate(:page => params[:page], :per_page => 10).order('id DESC')
    @title = "Отзывы"
  end

  # GET /cp/reviews/1
  # GET /cp/reviews/1.json
  def show
  end

  # GET /cp/reviews/new
  def new
    @cp_review = Review.new
  end

  # GET /cp/reviews/1/edit
  def edit
  end

  # POST /cp/reviews
  # POST /cp/reviews.json
  def create
    @cp_review = Review.new(cp_review_params)

    respond_to do |format|
      if @cp_review.save
        format.html { redirect_to cp_review_path(@cp_review), notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @cp_review }
      else
        format.html { render :new }
        format.json { render json: @cp_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cp/reviews/1
  # PATCH/PUT /cp/reviews/1.json
  def update
    respond_to do |format|
      if @cp_review.update(cp_review_params)
        format.html { redirect_to cp_review_path(@cp_review), notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @cp_review }
      else
        format.html { render :edit }
        format.json { render json: @cp_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cp/reviews/1
  # DELETE /cp/reviews/1.json
  def destroy
    @cp_review.destroy
    respond_to do |format|
      format.html { redirect_to cp_reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

 def activate
  @cp_review.isValid = true
  @cp_review.save!
   respond_to do |format|
      format.html { redirect_to cp_reviews_url, notice: 'Review was successfully activated.' }
      format.json { head :no_content }
    end
 end

 def deactivate
  @cp_review.isValid = false
    @cp_review.save!
   respond_to do |format|
      format.html { redirect_to cp_reviews_url, notice: 'Review was successfully deactivated.' }
      format.json { head :no_content }
    end
 end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cp_review
      @cp_review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cp_review_params
      params.require(:review).permit(:name, :cause, :comment, :isValid)
    end
end
