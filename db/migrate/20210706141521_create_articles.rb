class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :state, null: false, foreign_key: true
      t.integer :likes

      t.timestamps
    end
  end
end
