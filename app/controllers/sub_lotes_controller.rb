class SubLotesController < ApplicationController
  skip_authorize_resource :only => :new
  load_and_authorize_resource :only => [:show,:destroy,:edit,:update]

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

  private

  def sub_lote_params
    params.require(:sub_lote).permit(:name, :code, :tree_count, :plantation_date, :fruit_variety, :lote_id)
  end
end
