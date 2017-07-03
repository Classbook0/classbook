class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :curso
  has_many :note
  enum perfil: [ :Administrador, :Profesor, :Alumno ]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
