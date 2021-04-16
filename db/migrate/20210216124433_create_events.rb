class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events, &:timestamps
  end
end
