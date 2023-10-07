class RemoveFotoFromVisitantes < ActiveRecord::Migration[7.1]
  def change
    remove_column :visitantes, :foto, :string
  end
end
