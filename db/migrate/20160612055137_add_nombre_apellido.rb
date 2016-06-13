class AddNombreApellido < ActiveRecord::Migration
  def change
  	add_column :users, :nombre, :String
  	add_column :users, :apellido, :String
  end
end
