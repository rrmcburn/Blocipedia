class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators

  default_scope { order('created_at DESC') }

  def collaborator_for(user)
   collaborators.where(user_id: user.id).first
  end
 
end
