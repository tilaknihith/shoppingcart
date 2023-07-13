class LineItemsController < ApplicationController
	def create
		@cart= current_cart
		product = Product.find(params[:product_id])
		@line_item = @cart.line_items.find_or_initialize_by(product: product)

		if @line_item.save
			redirect_to @cart, notice: 'Product added to cart.'
		else
			render :new
		end
	end
end
