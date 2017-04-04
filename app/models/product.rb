class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates(:title, { presence: { message: 'must be present!' }, uniqueness: true })
  validates(:description,{ presence: true, length: { minimum: 10 } })
  validates(:price, { presence: true, numericality: { greater_than_or_equal_to: 0 }})

  def self.search(find)
    self.where(["title ILIKE ? OR description ILIKE ?", "%"+find+"%", "%"+find+"%"])
    order('title')
  end

  after_initialize :set_defaults
  before_validation :capitalize_title

  private

  def set_defaults
    self.price ||= 1
  end

  def capitalize_title
    self.title = title.capitalize if title.present?
  end

end
