class Api::MessagesController < ApplicationController

	def index
		@messages = Message.all
		respond_to do |format|
			format.json {render json: @messages.as_json(only: [:id, :status, :category_name, :title, :content, :created_at])}
		end
	end
end
