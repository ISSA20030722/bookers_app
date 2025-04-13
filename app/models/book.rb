class Book < ApplicationRecord
  # バリデーション→空のデータ保存を許さない機能
  validates :title, presence: true
  validates :body, presence: true
end
