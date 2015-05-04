class UsersController < ApplicationController
  def index
    if session[:user_co] == true
      redirect_to sondages_url
    end
    @user = User.new
  end

  def connect
    params[:user][:mdp]
    redirect_to sondages_url
  end

  def new
    @user = User.new
  end

  def create
    User.create create_params
    redirect_to index
  end

  protected

  def create_params
    params.require(:user).permit(:naissance, :sexe, :etat_civil, :pop_foyer, :pop_enfant, :pop_animaux, :revenus)
  end
end
