class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def rol_enum
        [ [ 'Usuario', '0' ], [ 'Administrador de Contenidos', '1' ], [ 'Administrador General', '2' ] ]
    end
end
