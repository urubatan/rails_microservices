class CreateSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :sessions do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :last_token
      t.boolean :active

      t.timestamps
    end
  end
end
