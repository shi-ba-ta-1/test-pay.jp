class CreateCredits < ActiveRecord::Migration[5.0]
  def change
    create_table :credits do |t|
      t.references :user, null: false, foreign_key: true
      t.string :costomer_id, null: false
      t.string :card_id, null:false
      t.timestamps
    end
  end
end
