class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates_presence_of :nombre,:apellido
  validates :nombre, length: { maximum: 30 }
  validates :apellido, length: { maximum: 30 }
  String :nombre
  String :apellido
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def rol_enum
        [ [ 'Usuario', '0' ], [ 'Administrador de Contenidos', '1' ], [ 'Administrador General', '2' ] ]
    end
end
