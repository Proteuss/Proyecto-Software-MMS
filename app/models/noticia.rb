class Noticia < ActiveRecord::Base
	validates_presence_of :titulo, :contenido, :descripcion
	validates :descripcion, length: { maximum: 200 }
	has_attached_file :portada, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :portada, content_type: /\Aimage\/.*\Z/
    String :descripcion
end
