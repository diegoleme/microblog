class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
      :title,
      [:title, :id]
    ]
  end

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :message, presence: true
end
