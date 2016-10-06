class Carriage < ActiveRecord::Base
  belongs_to :train
  before_validation :set_carriage_number, if: :train_id?
  validates :number, uniqueness: {scope: :train_id, message: "Carriage number should be unique within train"}

  TYPES = {CoupeCarriage: "Coupe class", EconomyCarriage: "Economy class", FirstCarriage: "First class", SittingCarriage: "Sitting class"}

  scope :economy_class, -> {where(type: "EconomyCarriage")}
  scope :coupe_class, -> {where(type: "CoupeCarriage")}
  scope :first_class, -> {where(type: "FirstClassCarriage")}
  scope :sitting_class, -> {where(type: "ESittingCarriage")}

  scope :ordered, -> (sort) { order("carriages.number #{sort ? 'ASC' : 'DESC'}")}

  def get_type_name_for_partial
    "#{TYPES[self.type.to_sym].match(/^\S+/)[0].downcase}_carriage"
  end

  def get_type
    TYPES[self.type.to_sym]
  end

  def get_all_types_names
    TYPES.invert
  end

  private

  def set_carriage_number
    max_number = Carriage.where(train_id: self.train_id).maximum(:number)
    self.number = max_number ? max_number + 1 : 1
  end
end