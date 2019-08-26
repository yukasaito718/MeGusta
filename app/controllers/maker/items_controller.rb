class Maker::ItemsController < ApplicationController
	before_action :authenticate_maker!
	def index
		if params[:tag]
		@items = Item.tagged_with(params[:tag])
		else
		@items = Item.all
		end
		maker =current_maker
		@maker_items = maker.items
	end
	def new
		@item = Item.new
	end
    def create  #投稿保存#form_forの情報がやってくるアクション
		@item = Item.new(item_params)
		@item.maker_id = current_maker.id
		if @item.save!
            flash[:notice] = "商品登録に成功しました。"
    		redirect_to makerpage_path
		else
			flash[:notice] = "登録内容
			に不備があります。再度入力をお願いいたします。"
            redirect_to makerpage_path
        end
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:id])
		if @item.update(item_params)
			flash[:notice] = "編集内容を更新しました。"
			redirect_to makerpage_path
		else
			flash[:notice] = "編集の更新に失敗しました"
			redirect_to makerpage_edit_path
		end
	end
	def destroy
		item = Item.find(params[:id])
		item.destroy
		redirect_to makerpage_path
	end

	private

	def item_params
		params.require(:item).permit(:item_name, :price, :count, :url, :is_sold, :image, :maker_id, :is_refrigeration, :is_packaged, :freshness_date, category_ids: [], shop_ids: [])
	end
end