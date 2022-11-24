# frozen_string_literal: true

class CreateGroupRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :group_records do |t|
      t.references :group, null: false, foreign_key: true
      t.references :record, null: false, foreign_key: true

      t.timestamps
    end
  end
end
