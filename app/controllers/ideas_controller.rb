class IdeasController < ApplicationController
    def idea
        @idea = Idea.find_by_id(params[:idea_id])
        @liked_idea = Like.where(idea: params[:idea_id])
    end

    def add
        user = User.find_by_id(session[:user_id])
        idea = Idea.create(content: params[:content], user: user)
        if !idea.valid?
            flash[:errors] = idea.errors.full_messages
        end
        redirect_to :back
    end

    def destroy
        Idea.find_by_id(params[:idea_id]).destroy
        redirect_to :back
    end
end
