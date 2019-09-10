class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.datetime :date
    end
  end
end
