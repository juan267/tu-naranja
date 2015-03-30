class EmployeesController < ApplicationController
  def index
    @employees = User.where(farm_id: params[:farm_id])
    @farm = Farm.find(params[:farm_id])
  end
end
