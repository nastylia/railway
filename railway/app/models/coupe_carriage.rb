class CoupeCarriage < Carriage
  validates :up_seats, :down_seats, presence: true
end