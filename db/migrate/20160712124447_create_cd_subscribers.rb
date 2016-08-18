class CreateCdSubscribers < ActiveRecord::Migration[5.0]
  def change
    create_table :subscribers do |t|
      t.string :email
      t.boolean :active, default: true
      t.string :secret_name

      t.timestamps
    end
  end
end
