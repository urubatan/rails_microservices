class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :callback_url
      t.string :auth_key

      t.timestamps
    end
  end
end
