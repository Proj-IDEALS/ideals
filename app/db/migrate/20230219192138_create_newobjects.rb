class CreateNewobjects < ActiveRecord::Migration[7.0]
  def change
    create_table :theories do |t|
      t.string  :name
      t.text    :description
      t.timestamps
    end

    create_table :assumptions do |t|
      t.string  :name
      t.text    :description
      t.timestamps
    end

    create_table :practices do |t|
      t.string  :name
      t.text    :description
      t.timestamps
    end

    create_table :assumptions_theories, id: false do |t|
      t.belongs_to :assumption
      t.belongs_to :theory
    end

    create_table :assumptions_practices, id: false do |t|
      t.belongs_to :assumption
      t.belongs_to :practice
    end
  end
end
