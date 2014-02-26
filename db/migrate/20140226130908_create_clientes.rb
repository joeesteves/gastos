class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :codigo
      t.string :nombre

      t.timestamps
    end
  end
end
