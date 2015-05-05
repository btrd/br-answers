class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:naissance, :sexe, :etat_civil, :pop_foyer, :pop_enfant, :pop_animaux, :revenus, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:naissance, :sexe, :etat_civil, :pop_foyer, :pop_enfant, :pop_animaux, :revenus, :email, :password, :password_confirmation, :current_password)
  end
end