class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.belongs_to :user, index: true
      t.belongs_to :article, index: true

      t.timestamps
    end
  end
end
