class CreateTexters < ActiveRecord::Migration[6.0]
  def change
    create_table :texters do |t|
      t.string :client_name
      t.text :message_description

      t.timestamps
    end
  end
end
