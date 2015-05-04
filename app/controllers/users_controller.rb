class UsersController < ApplicationController
  def index
    if session[:user_co]
      redirect_to sondages_url
    end
    @user = User.new
  end

  def connect
    session[:user] = User.find_by mdp: params[:user][:mdp]
    session[:user_co] = true

    redirect_to sondages_url
  end

  def new
    @user = User.new
  end

  def create
    session[:user] = User.create create_params
    session[:user_co] = true

    redirect_to sondages_url
  end

  def deco
    session[:user_co] = false
    redirect_to index
  end

  protected

  def create_params
    params.require(:user).permit(:naissance, :sexe, :etat_civil, :pop_foyer, :pop_enfant, :pop_animaux, :revenus)
  end
end
