class QuestionsController < ApplicationController
  def index
  end

  def show
    @sondage = Sondage.find params[:sondage_id]
    @question = Question.find params[:id]
    @reponse = Reponse.new
    redirect_to sondages_path if not @sondage.questions.include?(@question)
  end
end
