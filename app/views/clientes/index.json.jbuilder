json.array!(@clientes) do |cliente|
  json.extract! cliente, :id, :codigo, :nombre
  json.url cliente_url(cliente, format: :json)
end
