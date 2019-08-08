class Maker::ItemsController < ApplicationController

	def new
		@item = Item.new
	end

    def create  #投稿保存#form_forの情報がやってくるアクション
		@item = Item.new(item_params)
		p 'test'
		p current_maker
		p current_maker[:id]
		p current_maker.id
		p @item
		@item.maker_id = current_maker.id
		if @item.save
            flash[:notice] = "商品登録に成功しました。"
    		redirect_to makerpage_path
		else
			flash[:notice] = "登録内容
			に不備があります。再度入力をお願いいたします。"
            redirect_to new_maker_item
        end
	end

	private

	def item_params
		params.require(:item).permit(:item_name, :price, :count, :url, :is_sold, :image, :maker_id)
	end
end