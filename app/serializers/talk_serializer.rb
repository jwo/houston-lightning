class TalkSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :twitter, :description
end
