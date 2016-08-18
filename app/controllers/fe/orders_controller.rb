class Fe::OrdersController < ApplicationController
  def create
    @order = Order.new.tap do |order|
      order.front_image = Paperclip.io_adapters.for(params[:order][:front_img])
      order.back_image = Paperclip.io_adapters.for(params[:order][:back_img])
      order.right_sleeve_image = Paperclip.io_adapters.for(params[:order][:right_sleeve_img])
      order.left_sleeve_image = Paperclip.io_adapters.for(params[:order][:left_sleeve_img])
      order.name = params[:order][:name]
      order.mobile = params[:order][:mobile]
      order.email = params[:order][:email]
      order.comment = params[:order][:comment]
      order.color = params[:order][:color]
      order.size = params[:order][:size]
      order.shirt_type = params[:order][:shirt_type]

    end
    respond_to do |format|
      if @order.save
        format.html { redirect_to fe_root_url, notice: 'order was successfully created.' }
        format.js {}
        unless params[:array].empty?
        hash = JSON.parse params[:array]
        hash.each do |image|
          @image = Image.new
          @image.order_id = @order.id
          @image.image = Paperclip.io_adapters.for(image)
          @image.save
        end
      end
      end
    end

  end

private
  def order_params
    params.require(:order).permit(:name, :mobile, :email, :comment, :front_img, :back_img, :right_sleeve_img, :left_sleeve_img, :color, :size)
  end
end
