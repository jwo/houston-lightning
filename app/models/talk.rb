class Talk < ActiveRecord::Base
  def self.ordered
    scoped.order("created_at ASC")
  end
end
