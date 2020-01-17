class Micropost < ApplicationRecord
  belongs_to :user
  before_validation :set_in_reply_to
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :in_reply_to, presence: false
  validate  :picture_size, :reply_to_user
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

  # 投稿に返信をする際のスコープの定義
  def Micropost.including_replies(id)
    where(in_reply_to: [id, 0]).or(Micropost.where(user_id: id))
  end

  # 数値のチェック
  def is_i?(s)
    Integer(s) != nil rescue false
  end

  # 投稿に返信を行う
  def set_in_reply_to
    if @index = content.index("@")
      reply_id = []
      while is_i?(content[@index+1])
        @index += 1
        reply_id << content[@index]
      end
      self.in_reply_to = reply_id.join.to_i
    else
      self.in_reply_to = 0
    end
  end

  private

    # 指定されたユーザー名が正しいかチェック
    def reply_to_user_name_correct?(user)
      user_name = user.name.gsub(" ", "-")
      content[@index+2, user_name.length] == user_name
    end

    # 返信機能のバリデーション
    def reply_to_user
      return if self.in_reply_to == 0
      unless user = User.find_by(id: self.in_reply_to)
        errors.add(:base, "存在しないユーザーIDです。")
      else
        if user_id == self.in_reply_to
          errors.add(:base, "自分には返信出来ません。")
        else
          unless reply_to_user_name_correct?(user)
            errors.add(:base, "ユーザーIDと名前が一致しません。")
          end
        end
      end
    end

    # アップロードされた画像のサイズのバリデーション
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "ファイルサイズが大きすぎます。（最大で5MBまで）")
      end
    end
end
