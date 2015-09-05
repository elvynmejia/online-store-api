class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :price, :published
  #embed the user object into the product 
  has_one :user 
end
