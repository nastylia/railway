class AddTrainsIdToCarriages < ActiveRecord::Migration[5.0]
  def change
    add_belongs_to :carriages, :train
  end
end
