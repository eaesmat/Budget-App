class Group < ApplicationRecord
  belongs_to :user
  has_one_attached :icon
  has_many :group_records, dependent: :destroy
  has_many :records, through: :group_records, dependent: :destroy

  validates :name, :icon, presence: true

  def amount
    amount = 0
    records.each { |record| amount += record.amount }
    amount
  end
end
