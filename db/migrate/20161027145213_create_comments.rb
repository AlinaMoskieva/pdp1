class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.belongs_to :user, null: false, index: true, foreign_key: true
      t.belongs_to :article, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
