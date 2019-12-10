class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :profile_image, ImageUploader
         
  has_many :active_relationships,   class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :following,              through: :active_relationships
  has_many :passive_relationships,  class_name: "Relationship", foreign_key: "following_id", dependent: :destroy 
  has_many :followers,              through: :passive_relationships, source: :follower

  has_one :article

  def following?(other_user)
    following.include?(other_user)
  end

  def followers?(other_user)
    followers.include?(other_user)
  end

  def matchers
    following & followers
  end

  validates :nickname,               presence: true, length: {maximum: 20}
  validates :lastname_kanji,         presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :firstname_kanji,        presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :lastname_kana,          presence: true, format: {with: /\A[ぁ-んァ-ヶー－]+\z/}
  validates :firstname_kana,         presence: true, format: {with: /\A[ぁ-んァ-ヶー－]+\z/}
end
