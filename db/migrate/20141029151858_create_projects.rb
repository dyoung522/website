class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :summary
      t.text :detail
      t.string :url

      t.timestamps
    end
  end
end
