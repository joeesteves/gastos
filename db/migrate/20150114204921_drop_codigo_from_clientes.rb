class DropCodigoFromClientes < ActiveRecord::Migration
  def change
  	remove_column :clientes, :codigo
  end
end
