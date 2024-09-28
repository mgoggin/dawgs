class CreateBookings < ActiveRecord::Migration[7.2]
  def change
    create_table :bookings do |t|
      t.belongs_to :dog, null: false, foreign_key: true
      t.belongs_to :walker, null: false, foreign_key: {to_table: :users}
      t.date :pick_up_on
      t.string :period
      t.string :status

      t.timestamps
    end
  end
end
