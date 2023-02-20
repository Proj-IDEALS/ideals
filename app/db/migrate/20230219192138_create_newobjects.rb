class CreateNewobjects < ActiveRecord::Migration[7.0]
  def change
    create_table :newobjects do |t|
      t.string :Name
      t.string :Category
      t.text :Details
      t.string :Linkto

      t.timestamps
    end
  end
end
