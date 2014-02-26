class CreateGastos < ActiveRecord::Migration
  def change
    create_table :gastos do |t|
      t.date :fecha
      t.text :concepto, :precision => 8, :scale => 2
      t.decimal :ingreso, :precision => 8, :scale => 2
      t.decimal :egreso
      t.references :cliente, index: true

      t.timestamps
    end
  end
end
