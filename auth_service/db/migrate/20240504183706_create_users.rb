class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.belongs_to :client, null: false, foreign_key: true
      t.string :email
      t.string :name
      t.string :password_digest

      t.timestamps
    end
  end
end
