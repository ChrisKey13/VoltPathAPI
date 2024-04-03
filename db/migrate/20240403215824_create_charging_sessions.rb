class CreateChargingSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :charging_sessions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :status
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
