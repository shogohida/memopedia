class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :summary
      t.integer :year
      t.text :content

      t.timestamps
    end
  end
end
