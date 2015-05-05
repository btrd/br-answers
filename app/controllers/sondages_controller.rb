class SondagesController < ApplicationController
  def index
    @sondages = Sondage.all
  end

  def show
    @sondage = Sondage.find(params[:id])
    if @sondage == nil
      redirect_to index
    end
  end
end
