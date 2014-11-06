class AdminController < ApplicationController
	def main
		@users = Users.all
	end
end
