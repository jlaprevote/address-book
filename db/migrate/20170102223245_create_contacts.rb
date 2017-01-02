class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :f_name
      t.string :l_name
      t.string :address
      t.string :phone
      t.string :email
# TODO add image? paperclip?

      t.timestamps
    end
  end
end
