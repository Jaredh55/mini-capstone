# json.id @carted_product.id
# json.quantity @carted_product.quantity
# json.status @carted_product.status
# json.product do 
#   json.partial! @carted_product.product,partial: 'api/products/product', as: :product
# end

json.partial! @carted_product, partial: 'carted_product', as: :carted_product