class CreateDogs < ActiveRecord::Migration[7.2]
  def change
    create_table :dogs do |t|
      t.string :name, null: false
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
