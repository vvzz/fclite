class AddCodeToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :code, :string
  end
end
