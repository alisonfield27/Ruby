class UserController < ApplicationController
	def login
	end
	
	def admin_login
		session[:login]=1
		flash[:notice]="Login Successful. Welcome Back!"
		redirect_to :controller=> :courses
	end

	def logout
		session[:login]=nil
		flash[:notice]="Log out sucessful."
		redirect_to :controller=> :courses
	end	
	
end
