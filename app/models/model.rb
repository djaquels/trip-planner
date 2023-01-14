class Model < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #has_many :lugars, :through => :model_visitums
  #validates :email, :presence => true, :email => true
  has_many :model_visitums , :foreign_key => :id_usuario
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable
  has_one_attached :avatar
  has_many :lugars, :foreign_key => :id_usuario
end
