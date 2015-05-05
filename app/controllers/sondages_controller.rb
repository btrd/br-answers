class SondagesController < ApplicationController
  def index
    @sondages = Sondage.all
  end

  def show
    @sondage = Sondage.find(params[:id])
    @nb_quest = @sondage.questions.count
  end
end
