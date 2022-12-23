class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
    @articles = Article.search(params[:search]).page(params[:page]).without_count.per(4)

    if turbo_frame_request?
      render(partial: "articles", locals: {articles: @articles})
    else
      render :index
    end
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
