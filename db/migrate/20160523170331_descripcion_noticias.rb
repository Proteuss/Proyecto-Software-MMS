class DescripcionNoticias < ActiveRecord::Migration
  def change
    add_column :noticias, :descripcion, :String
  end
end
