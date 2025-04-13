class ChangeColumnsInBooks < ActiveRecord::Migration[6.1]
  def change
    # 既に存在するカラム「本のタイトル」と「感想」を削除
    remove_column :books, :本のタイトル, :string
    remove_column :books, :感想, :string

    # 新しく「title」と「body」というカラムを追加
    add_column :books, :title, :string
    add_column :books, :body, :string
  end
end

