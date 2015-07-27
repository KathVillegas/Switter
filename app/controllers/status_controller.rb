class StatusController < ApplicationController
	def sweet
		if status = Status.where(comment_id: params[:comment_id], user_id: session[:user_id], status: 0).first()
			status.destroy
		elsif status = Status.where(comment_id: params[:comment_id], user_id: session[:user_id], status: 1).first()
			status.update(status: 0)

		else
			Status.create(:comment_id => params[:comment_id], :user_id => session[:user_id], :status => 0)
		end
	end

	def sour
		if status = Status.where(comment_id: params[:comment_id], user_id: session[:user_id], status: 1).first()
			status.destroy
		elsif status = Status.where(comment_id: params[:comment_id], user_id: session[:user_id], status: 0).first()
			status.update(status: 1)

		else
			Status.create(:comment_id => params[:comment_id], :user_id => session[:user_id], :status => 1)
		end
	end
end
