class CreateUnidades < ActiveRecord::Migration[7.1]
  def change
    create_table :unidades do |t|
      t.string :nome

      t.timestamps
    end
  end
end
