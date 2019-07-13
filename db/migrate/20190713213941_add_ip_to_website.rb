class AddIpToWebsite < ActiveRecord::Migration[5.1]
  def change
    add_column :websites, :ip, :inet
  end
end
