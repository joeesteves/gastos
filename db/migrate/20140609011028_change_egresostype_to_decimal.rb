class ChangeEgresostypeToDecimal < ActiveRecord::Migration
  def change
  	change_column :gastos, :egreso, :decimal, :precision => 8, :scale => 2
  end
end
