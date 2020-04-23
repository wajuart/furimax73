class AddFamilyNameKanaToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :family_name_kana, :string, null: false, default: ''

    # removeで消去済み
    add_column :users, :string, :string, null: false, default: ''
  end
end
