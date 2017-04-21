class LikesController < ApplicationController
    def like
        Like.create(user:User.find_by_id(params[:id]), idea:Idea.find_by_id(params[:idea_id]))
        redirect_to :back
    end

    def unlike
        Like.find_by_user_id_and_idea_id(params[:id], params[:idea_id]).destroy
        redirect_to :back
    end
end
