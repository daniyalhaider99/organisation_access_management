class AddParentalConsentToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :parent_email, :string
  end
end