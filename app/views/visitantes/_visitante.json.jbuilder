json.extract! visitante, :id, :cpf, :nome, :rg, :telefone, :foto, :created_at, :updated_at
json.url visitante_url(visitante, format: :json)
