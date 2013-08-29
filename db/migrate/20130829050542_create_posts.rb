class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.date :start
      t.date :end
      t.text :description
      t.boolean :available
      t.float :monthly
      t.float :security
      t.boolean :last
    end
  end
end
