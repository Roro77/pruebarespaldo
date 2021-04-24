class FriendsController < ApplicationController
        # POST /tweets or /tweets.json
    def create
        friend_id = params[:id]
        @friend = Friend.new(user: current_user, follower_id: friend_id)
        respond_to do |format|
            if @friend.save
                format.html { redirect_to root_path, notice: "Tweet was successfully created." }
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end
end
