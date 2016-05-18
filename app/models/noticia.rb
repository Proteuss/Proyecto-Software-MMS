class Noticia < ActiveRecord::Base
	validates_presence_of :titulo, :contenido
end
