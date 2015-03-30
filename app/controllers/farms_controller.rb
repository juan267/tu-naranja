class FarmsController < ApplicationController
  load_and_authorize_resource

  def index
    @farms = Farm.all
  end

  def show
  end

end
