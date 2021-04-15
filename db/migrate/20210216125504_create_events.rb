# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references :user,              null: false, foreign_key: true
      t.string     :title,             null: false
      t.integer    :category_id,       null: false
      t.text       :comment,           null: false
      t.datetime   :event_datetime,    null: false
      t.datetime   :meeting_time,      null: false
      t.integer    :place_id,          null: false
      t.integer    :price
      t.text       :bring,             null: false
      t.datetime   :deadline_datetime, null: false
      t.timestamps                     null: false
    end
  end
end
