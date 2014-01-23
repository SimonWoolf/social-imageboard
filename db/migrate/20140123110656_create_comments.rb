class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :post, index: true
      t.text :text
      t.string :name

      t.timestamps
    end
  end
end
