class CreateWebsites < ActiveRecord::Migration[5.1]
  def change
    create_table :websites do |t|
      t.string :weburl
      t.string :email

      t.timestamps
    end
  end
end
