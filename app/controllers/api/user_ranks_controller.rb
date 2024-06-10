class Api::UserRanksController < ApiController


	def update
		@user_rank = UserRank.find_by(id: user_rank_params[:id], user_id: current_client.users.pluck(:id))
		@user_rank.assign_attributes(user_rank_params)
		@result = @user_rank.save
		@error_msg = @user_rank.errors.full_messages
	end

	private
	def set_user_rank
		@user_rank = current_client.user_ranks.find(params[:id])
	end

	def user_rank_params
		params.require(:user_rank).permit(:id, :user_id, :rank_id)
	end

end
