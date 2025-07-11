class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :age_group
      t.date :birthdate
      t.boolean :parental_consent
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
