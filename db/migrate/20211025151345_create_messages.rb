class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :room, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true
      t.references :doctor
      t.text :message

      t.timestamps
    end
  end
end
