class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate  :picture_size                                       #画像サイズ用のバリデーション。
  has_many  :likes, dependent: :destroy
  has_many  :iine_users, through: :likes, source: :user

  # 投稿にいいねをする
  def iine(user)
    likes.create(user_id: user.id)
  end

  # いいねを削除する
  def uniine(user)
    likes.find_by(user_id: user.id).destroy
  end

  # 現在のユーザーがいいねをしていた場合、trueを返す
  def iine?(user)
    iine_users.include?(user)
  end

  private

    # アップロードされた画像のサイズをバリデーションする。
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "ファイルサイズが大きすぎます。（最大で5MBまで）")
      end
    end
end
