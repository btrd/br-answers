class NewTableGraph < ActiveRecord::Migration
  def change
    create_table :graph do |t|
      t.integer :id_sondage
      t.integer :id_question
      t.integer :reponse_given

      t.boolean :reponse_spe
      t.boolean :moyenne
      t.boolean :pourcentage
      t.string :pop_cible
      t.string :axe_abscisse
    end
  end
end
