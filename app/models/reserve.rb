class Reserve < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many :invoices

  validates :start_date, :end_date, presence: true

end
