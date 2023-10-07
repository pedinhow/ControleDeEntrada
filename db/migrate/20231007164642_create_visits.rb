class CreateVisits < ActiveRecord::Migration[7.1]
  def change
    create_table :visits do |t|
      t.references :visitante, null: false, foreign_key: true
      t.references :setor, null: false, foreign_key: true
      t.references :funcionario, null: false, foreign_key: true
      t.datetime :horario

      t.timestamps
    end
  end
end
