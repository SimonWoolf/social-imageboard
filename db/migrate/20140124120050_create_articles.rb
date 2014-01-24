class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.belongs_to :user, index: true
      t.string :link
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
