class ArticlesController < ApplicationController
	http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	# This action simply created a new article to be used in the form creation
	def new
		@article = Article.new
	end

	# This action recreates the article based in the input in the form creation
	def create
		@article = Article.new(article_params)

		if @article.save
			redirect_to @article
		else
			render :new, status: :unprocessable_entity
		end
	end

	# This action simply retrieves the object to be used in the updating form
	def edit
		@article = Article.find(params[:id])
	end

	# This action saves the object from the update form
	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render :edit, status: :unprocessable_entity
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to root_path, status: :see_other
	end

	private
		def article_params
			params.require(:article).permit(:title, :body, :status)
		end
end
