class ApplicationController < ActionController::Base
  include LocalSubdomain

  protect_from_forgery with: :exception
  @active_block = Block.find_by_name("Главная")
  layout :layout_by_resource
  def layout_by_resource
    if devise_controller?
      "cp"
    end
  end
end
