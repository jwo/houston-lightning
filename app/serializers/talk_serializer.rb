class TalkSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :twitter, :description, :started_at, :current_talk
end
