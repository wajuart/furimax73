class ChangeColumnToNotNull < ActiveRecord::Migration[5.2]
  def up
    change_column_null :destinations, :family_name, :string, null: false
    change_column_null :destinations, :first_name, :string, null: false
    change_column_null :destinations, :family_name_kana, :string, null: false
    change_column_null :destinations, :first_name_kana, :string, null: false
  end

  def down
    change_column_null :destinations, :family_name, :string
    change_column_null :destinations, :first_name, :string
    change_column_null :destinations, :family_name_kana, :string
    change_column_null :destinations, :first_name_kana, :string
  end
end
