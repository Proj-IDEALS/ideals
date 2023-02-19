class Newobject < ActiveRecord::Migration[7.0]
  def change
    add_column :newobjects, :Linkto, :string
  end
end
