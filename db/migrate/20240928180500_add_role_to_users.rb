class AddRoleToUsers < ActiveRecord::Migration[7.2]
  def change
    change_table :users do |t|
      t.string :role, null: false, default: "user", index: true
    end
  end
end
