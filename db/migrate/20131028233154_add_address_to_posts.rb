class AddAddressToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :address1, :string
    add_column :posts, :address2, :string
    add_column :posts, :city, :string
    add_column :posts, :postal, :string
    add_column :posts, :state, :string
  end
end
