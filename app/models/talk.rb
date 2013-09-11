class Talk < ActiveRecord::Base
  def self.ordered
    all.order("created_at ASC")
  end
end
