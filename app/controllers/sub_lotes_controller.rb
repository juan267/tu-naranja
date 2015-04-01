class SubLotesController < ApplicationController
  load_and_authorize_resource :only => [:show,:destroy,:edit,:update]


  def index
    @farm = Farm.find(params[:farm_id])
    @sub_lotes = @farm.sub_lotes
  end

  def show
    @time_frame = params[:time_frame]
  end

  def new
    @sub_lote = SubLote.new
  end

  def create
    @sub_lote = SubLote.new(sub_lote_params)
    if @sub_lote.save
      flash[:success] = "Nuevo Sub-Lote creado exitosamente"
      redirect_to farm_lote_path(@sub_lote.lote.farm, @sub_lote.lote)
    else
      flash[:danger] = "Error al crear Sub-Lote"
      @lote_id = @sub_lote.lote.id
      render :new
    end
  end

  def edit
  end

  def update
    @sub_lote = SubLote.find(params[:id])
    if @sub_lote.update(sub_lote_params)
      flash[:success] = "Sub-Lote Exitosamente Editado"
      redirect_to farm_sub_lote_path(@sub_lote.lote.farm, @sub_lote)
    else
      render :edit
    end
  end

  def destroy
    @sub_lote.destroy!
    flash[:success] = "Sub-Lote Destruido"
    redirect_to farm_lote_path(@sub_lote.lote.farm, @sub_lote.lote)
  end

  private

  def sub_lote_params
    params.require(:sub_lote).permit(:name, :code, :tree_count, :plantation_date, :fruit_variety, :lote_id)
  end
end
