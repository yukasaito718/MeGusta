


require 'rails_helper'

RSpec.describe User, type: :model do
	context "データが保存される" do
		before do
			@post = Post.new
			@post.title = "Hellow WebCamp"
			
end