class Fe::ReviewsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to fe_root_path, notice: 'request was successfully created.' }
        format.js {}
      end
    end
  end

  private

  def review_params
      params.require(:review).permit(:name, :cause, :comment, :photo)
  end
end
