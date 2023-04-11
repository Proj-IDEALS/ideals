# frozen_string_literal: true

class CreateMyObjects < ActiveRecord::Migration[7.0]
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

    create_join_table :assumptions, :theories do |t|
      t.index :assumption_id
      t.index :theory_id
    end

    create_join_table :assumptions, :practices do |t|
      t.index :assumption_id
      t.index :practice_id
    end
  end
end
