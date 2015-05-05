class AddExtraFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :naissance, :date
    add_column :users, :sexe, :string
    add_column :users, :etat_civil, :string
    add_column :users, :pop_foyer, :integer
    add_column :users, :pop_enfant, :integer
    add_column :users, :pop_animaux, :integer
    add_column :users, :revenus, :integer
  end
end
