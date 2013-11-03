class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.date :start
      t.string :name
      t.string :email
    end
  end
end
