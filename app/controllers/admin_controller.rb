class AdminController < ApplicationController
	def main
		@users = User.all
	end
end
