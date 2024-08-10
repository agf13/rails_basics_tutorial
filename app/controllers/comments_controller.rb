class CommentsController < ApplicationController
	http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

	def create
		@article = Article.find(params[:article_id])

		@comment = @article.comments.create(comment_params)
		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:article_id])
		#@comment = Comment.find(params[:id]) # works, but not the most efficient one, as it searches through all the comments
		@comment = @article.comments.find(params[:id]) # depending on how @articles.comments is retrieved, this might be faster / more efficient. But there is a chance that this is not necessarily the case
		@comment.destroy

		redirect_to article_path(@article), status: :see_other
	end

	private
		def comment_params
			params.require(:comment).permit(:commenter, :body, :status)
		end
end
