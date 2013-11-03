class AddPostRefToAppointments < ActiveRecord::Migration
  def change
    add_reference :appointments, :post, index: true
  end
end
