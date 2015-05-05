class SondagesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :redirect_to_index

  def index
    @sondages = Sondage.all
  end

  def show
    @sondage = Sondage.find(params[:id])
    if @sondage.questions.count > 0
      redirect_to sondage_question_path(@sondage, @sondage.questions[0])
    else
      redirect_to sondages_path
    end
    session["next_question"] = 0
  end

  def redirect_to_index
    redirect_to sondages_path
  end
end
