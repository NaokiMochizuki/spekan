class Api::UserRanksController < ApiController


	def update
		@user_rank = UserRank.find_by(id: user_rank_params[:id], user_id: current_client.users.pluck(:id))
		@user_rank.assign_attributes(user_rank_params)
		rank_id_changed = @user_rank.rank_id_changed?
		@result = @user_rank.save
		@user_rank.create_rank_record(current_client_user, @user_rank.rank_id_was) if @result && rank_id_changed
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
