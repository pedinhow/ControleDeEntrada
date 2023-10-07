class AddFotoToVisitantes < ActiveRecord::Migration[7.1]
  def change
    add_column :visitantes, :foto, :text
  end
end
