class WelcomeController < ApplicationController
  layout "trip"
  # GET /welcome
  before_action :authenticate_model!
  include Devise::Controllers::Helpers 
  def index
        @user = current_model
        @pais = Country.where(id: @user.pais)
  end

end
