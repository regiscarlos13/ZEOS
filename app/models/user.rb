class User < ApplicationRecord

  belongs_to :department
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, , :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable
end
