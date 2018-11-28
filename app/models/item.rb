class Item < ApplicationRecord

  has_many :line_items

  has_one_attached :image

  validates :title, :price, :description, presence: true
  validates :description, length: { maximum: 1000, too_long: "%{count} is the maximum allowed." }
  validates :title, length: { maximum: 100, too_long: "%{count} is the maximum allowed." }
  validates :price, numericality: { only_integer: true }, length: { maximum: 7 }

  before_destroy :not_referenced_by_any_line_item

  private

  def not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, "Item present")
      throw :abort
    end
  end

end
