class Country
  include Mongoid::Document
 has_many :states, dependent: :destroy
 field :name,  type: String
 field :status, type: Boolean
end
