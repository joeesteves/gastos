json.array!(@gastos) do |gasto|
  json.extract! gasto, :id, :fecha, :concepto, :ingreso, :egreso, :cliente_id
  json.url gasto_url(gasto, format: :json)
end
