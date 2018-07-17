class State
  include Mongoid::Document
  belongs_to :country
  field :name,  type: String
  belongs_to :country, foreign_key: :country_id
  field :status,     type: Boolean
end
