class Cp::AdminsController < ApplicationController
  before_action :authenticate_user!
  layout "cp"
end
