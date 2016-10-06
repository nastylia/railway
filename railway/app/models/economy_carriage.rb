class EconomyCarriage < Carriage
  validates :up_seats, :down_seats, :side_up_seats, :side_down_seats, presence: true
  validates :sit_seats, absence: true
  def self.model_name
    Carriage.model_name
  end
end