class Article < ApplicationRecord
  has_one_attached :cover_image
  validates :title, presence: true, length: { minimum: 6, maximum: 150 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :status, inclusion: { in: %w[draft published] }
  validates :published_at, presence: true, if: -> { status == "published" }

  before_create :set_random_views_count

  def set_random_views_count
    self.views_count = rand(50..2000)
  end

  def publish!
    update!(
      status: "published",
      published_at: Time.current
    )
  end
end