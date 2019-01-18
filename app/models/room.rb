class Room < ApplicationRecord
  has_many :reserves
  has_many :invoices
end
