class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :email, presence: true
  validates :introduction, length: { maximum: 50 }

  has_many :books, dependent: :destroy

  def get_profile_image(size)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize: size).processed
  end
end
