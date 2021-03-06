class CreateTutorials < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.string      :title
      t.text        :content
      t.references  :user, index: true, foreign_key: true
      t.string      :image
      t.string		  :slug

      t.timestamps null: false
    end
  end
end
