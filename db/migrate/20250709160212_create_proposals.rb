class CreateProposals < ActiveRecord::Migration[7.2]
  def change
    create_table :proposals do |t|
      t.string :title
      t.text :description
      t.references :organization, null: false, foreign_key: true
      t.string :age_group

      t.timestamps
    end
  end
end
