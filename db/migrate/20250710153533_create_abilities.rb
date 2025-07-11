class CreateAbilities < ActiveRecord::Migration[7.2]
  def change
    create_table :abilities do |t|
      t.string :resource_type
      t.string :action
      t.string :age_group
      t.boolean :allowed

      t.timestamps
    end
  end
end
