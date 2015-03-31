class SubLotesController < ApplicationController
  skip_authorize_resource :only => :new
  load_and_authorize_resource :only => [:show,:destroy,:edit,:update]

  def new
    @sub_lote = SubLote.new
    @lote =
  end
end
