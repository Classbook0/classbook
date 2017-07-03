class AddPerfilToToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :perfil, :integer
  end
end
