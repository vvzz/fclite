class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.float :rent
      t.float :security_deposit
      t.boolean :last_month_required
    end
  end

  def down
  end
end
