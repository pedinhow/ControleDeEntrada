json.extract! funcionario, :id, :nome, :setor_id, :created_at, :updated_at
json.url funcionario_url(funcionario, format: :json)
