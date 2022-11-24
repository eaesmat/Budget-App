class Record < ApplicationRecord
  belongs_to :user
  has_many :group_records, dependent: :destroy
  has_many :groups, through: :group_records

  validates :name, presence: true
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
