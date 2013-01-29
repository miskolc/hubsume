class AddInfoToUser < ActiveRecord::Migration
  def change
    execute "CREATE EXTENSION hstore"
     
    add_column :users, :token, :string
    add_column :users, :nickname, :string
    add_column :users, :urls, :hstore
  end
end
