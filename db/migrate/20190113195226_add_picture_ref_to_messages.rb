class AddPictureRefToMessages < ActiveRecord::Migration[5.2]
  def change
    add_reference :messages, :picture, foreign_key: true
  end
end
