class LotesController < ApplicationController
  skip_authorize_resource :only => :new
  load_and_authorize_resource :only => [:show,:destroy,:edit,:update]

  def index
    @farm = Farm.find(params[:farm_id])
    @lotes = Lote.where(farm_id: params[:farm_id])
  end

  def show
  end

  def new
    @lote = Lote.new
  end

  def create
    @lote = Lote.new(lote_params)
    if @lote.save
      flash[:success]  = "Nuevo lote creado Exitosamente"
      redirect_to farm_lotes_path(@lote.farm)
    else
      flash.now[:danger] = "No fue posible crear lote"
      render :new
    end
  end

  def edit
  end

  def update
    @lote = Lote.find(params[:id])
    if @lote.update(lote_params)
      flash[:success] = "Lote Exitosamente Editado"
      redirect_to farm_lote_path(@lote.farm, @lote)
    else
      render :edit
    end
  end

  def destroy
    @lote.destroy!
    flash[:success] = "Lote Destruido"
    redirect_to farm_lotes_path(@lote.farm)
  end

  private

  def lote_params
    params.require(:lote).permit(:name, :size, :fruit_type, :farm_id)
  end


end
