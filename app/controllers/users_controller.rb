class UsersController < ApplicationController
    def bright_ideas
        @user = User.find_by_id(session[:user_id])
        @liked_ideas =  Idea.joins(:likes).group("ideas.id").select("COUNT(likes.id) AS like_count, ideas.user_id, ideas.content, ideas.id").order("like_count DESC")
        @likes = Like.where(user: User.find_by_id(session[:user_id]))
        @ideas = Idea.all
    end

    def show
        @user = User.find_by_id(params[:id])
    end
end
