class ChangeColumnToNull < ActiveRecord::Migration[5.2]
  def up
    # Not Null制約を外す場合　not nullを外したいカラム横にtrueを記載
    change_column_null :destinations, :family_name, :string, null: true
    change_column_null :destinations, :first_name, :string, null: true
    change_column_null :destinations, :family_name_kana, :string, null: true
    change_column_null :destinations, :first_name_kana, :string, null: true
  end

  def down
    change_column_null :destinations, :family_name, :string, null: false
    change_column_null :destinations, :first_name, :string, null: false
    change_column_null :destinations, :family_name_kana, :string, null: false
    change_column_null :destinations, :first_name_kana, :string, null: false
  end
end
