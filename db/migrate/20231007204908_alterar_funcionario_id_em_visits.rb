class AlterarFuncionarioIdEmVisits < ActiveRecord::Migration[6.0]
  def change
    change_column :visits, :funcionario_id, :integer, null: true
  end
end
