class CreateStuffs < ActiveRecord::Migration
  def change
    create_table :stuffs do |t|
      t.belongs_to :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
