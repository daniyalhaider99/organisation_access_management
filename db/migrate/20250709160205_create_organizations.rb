class CreateOrganizations < ActiveRecord::Migration[7.2]
  def change
    create_table :organizations do |t|
      t.string :name
      t.integer :minimum_age, default: 0
      t.json :participation_rules

      t.timestamps
    end
  end
end
