class Maker::ItemsController < ApplicationController
	def index
		if params[:tag]
		@items = Item.tagged_with(params[:tag])
		else
		@items = Item.all
		end
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
            redirect_to root_path
        end
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		@item = Item.find(current_maker.id)
		if @item.update(item_params)
			flash[:notice] = "編集内容を更新しました。"
			redirect_to makerpage_path(current_maker)
		else
			flash[:notice] = "編集の更新に失敗しました"
			redirect_to makerpage_edit_path(current_maker)
		end
	end

	private

	def item_params
		params.require(:item).permit(:item_name, :price, :count, :url, :is_sold, :image, :maker_id, :is_refrigeration, :is_packaged, :freshness_date, category_ids: [])
	end
end