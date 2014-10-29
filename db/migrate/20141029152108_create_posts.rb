class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user, index: true
      t.references :project, index: true
      t.string :title
      t.text :detail

      t.timestamps
    end
  end
end
