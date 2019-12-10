class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.references :user, foreign_key: true
      t.string :first_title
      t.text :first_content
      t.text :first_image
      t.string :second_title
      t.text :second_content
      t.text :second_image
      t.string :third_title
      t.text :third_content
      t.text :third_image
      t.timestamps
    end
  end
end
