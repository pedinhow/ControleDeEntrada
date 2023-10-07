class AddEmailAndSenhaToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :senha, :string
  end
end
