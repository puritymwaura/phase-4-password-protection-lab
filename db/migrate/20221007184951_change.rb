class Change < ActiveRecord::Migration[6.1]
  def change

    remove_column :users, :password_digest
    add_column :users, :password_digest, :integer
  end
end
