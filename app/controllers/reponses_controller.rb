class ReponsesController < ApplicationController

  def create
    @sondage = Sondage.find params[:sondage_id]
    @question = Question.find params[:question_id]

    if @question.choixes.length > 0
      if @question.choix_multiple
        @question.choixes.each do |choix|
          if params.has_key?(choix.id.to_s)
            if params.has_key?("valeur_" + choix.id.to_s)
              valeur = params["valeur_" + choix.id.to_s]
            else
              valeur = ""
            end
            Reponse.create user_id: current_user.id, choix_id: choix.id, valeur: valeur
          end
        end
      else
        Reponse.create user_id: current_user.id, choix_id: params[@question.id.to_s], valeur: params["valeur_"+params[@question.id.to_s]]
      end
    end

    if session["next_question"] < @sondage.questions.length
      redirect_to sondage_question_path(@sondage, @sondage.questions[session["next_question"]])
    else
      current_user.sondages << @sondage
      flash[:notice] = "Sondage terminé"
      redirect_to sondages_path
    end
  end

end
