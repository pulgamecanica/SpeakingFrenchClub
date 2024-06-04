class User < ApplicationRecord
  has_many :events, through: :subscription
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :validatable

  def password_required?
    false
  end

end
