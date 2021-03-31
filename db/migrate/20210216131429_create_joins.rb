# frozen_string_literal: true

class CreateJoins < ActiveRecord::Migration[6.0]
  def change
    create_table :joins, &:timestamps
  end
end
