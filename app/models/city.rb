class City
  include Mongoid::Document
  belongs_to :country
  belongs_to :state
  field :name,  type: String
  belongs_to :country, foreign_key: :country_id
  belongs_to :state, foreign_key: :state_id
  field :status,     type: Boolean
end
