class AddImageToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :imagemessage, :string
  end
end
