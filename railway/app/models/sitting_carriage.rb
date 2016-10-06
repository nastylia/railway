class SittingCarriage < Carriage
  validates :sit_seats, presence: true
  validates :side_up_seats, :side_down_seats, :up_seats, :down_seats, absence: true

  def self.model_name
    Carriage.model_name
  end
end