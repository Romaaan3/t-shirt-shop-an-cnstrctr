class Fe::RequestsController < ApplicationController
  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to fe_kontakty_path, notice: 'request was successfully created.' }
        format.js { }
      end
    end
  end

  private

  def request_params
      params.permit(:name, :email, :comment)
  end
end
