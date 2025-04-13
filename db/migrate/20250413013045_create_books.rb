class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    # テーブル名はbooks
    # カラム名は本のタイトル、感想
    create_table :books do |t|
      t.string :title
      t.string :body
      t.timestamps
    end
  end
end
