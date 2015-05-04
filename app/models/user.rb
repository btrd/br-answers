class User < ActiveRecord::Base
  has_and_belongs_to_many :sondages
  has_many :choixes, :through => :reponses
  before_save :set_mdp
  def set_mdp
    self.mdp = SecureRandom.uuid
  end
end
