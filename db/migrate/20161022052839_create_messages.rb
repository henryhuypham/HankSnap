class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :subject
      t.text :content
      t.integer :status, default: 0
      t.references :sender, index: true

      t.timestamps
    end
  end
end
