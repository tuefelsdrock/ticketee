class AddConfirmableFieldsToUsersPart2 < ActiveRecord::Migration
  def change
      # t.string   :unconfirmed_email # Only if using reconfirmable
    add_column :users, :unconfirmed_email, :string
  end
end
