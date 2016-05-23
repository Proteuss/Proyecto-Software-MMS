class PortadaNoticia < ActiveRecord::Migration
  def up
    add_attachment :noticias, :portada
  end
  def down
    remove_attachment :noticias, :portada
  end
end
