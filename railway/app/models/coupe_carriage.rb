class CoupeCarriage < Carriage
  validates :up_seats, :down_seats, presence: true
  validates :side_up_seats, :side_down_seats, :sit_seats, absence: true

  def self.model_name
    Carriage.model_name
  end
end