class StoreCredential
  include ActiveModel::Model

  attr_accessor :api_key, :api_password, :store_name
  validates :api_key, :api_password, :store_name, presence: true
end
