
class StoriesController < ApplicationController

	def index

		if params[:sort] and params[:sort] == "top"
			@stories = Story.order ("votes_count DESC")
		else
			@stories = Story.order("created_at DESC") 
		end


	end

		def show
			@story = Story.find(params[:id])
			@votes = @story.votes
		end
		
		def new
			@story = Story.new
		end

		def create
			@story = Story.new(story_params)

			if @story.save
				flash[:success] = "Thanks for Sharing"
				redirect_to story_path(@story)
			else
				flash[:error] = "Oops, sorry, something went wrong"
				render :new
			end
		end

		def edit
		end

		def update
		end

		def destroy
		end

		private
		def story_params
			params.require(:story).permit(:title, :body, :url, :author)
		end

end
