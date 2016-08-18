class TinymceAssetsController < ApplicationController
  respond_to :json

  def create
    image    = NewsPhoto.create photo: params[:file], alt: params[:alt], hint: params[:hint]
    geometry = Paperclip::Geometry.from_file image.photo.path

    render json: {
      image: {
        url:    image.photo.url,
        height: geometry.height.to_i,
        width:  geometry.width.to_i
      }
    }, layout: false, content_type: "text/html"
  end
end
