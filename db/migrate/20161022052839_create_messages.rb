class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :subject
      t.text :content
      t.integer :status
      t.references :sender, foreign_key: true

      t.timestamps
    end
  end
end
