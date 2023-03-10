class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show]
  before_action :validate_session, only: [:index]

  # GET /articles or /articles.json
  def index
    @articles = Article.search(params[:search]).page(params[:page]).without_count.per(4)

    if turbo_frame_request?
      render(partial: 'articles', locals: { articles: @articles })
    else
      render :index
    end
    save_trend(session[:user_id], params[:search]) if params[:search].present?
  end

  # GET /articles/1 or /articles/1.json
  def show; end

  def save_trend(session_id, search)
    return unless search.length > 2

    @latest_trend = Trend.new(trend_params)
    @latest_trend.session_id = session_id
    session_trends = Trend.where(session_id:)

    # Update previous searches or save if new
    @latest_trend.save if session_trends.empty?
    data_count = 0
    while data_count < session_trends.length && (session_trends[data_count].search.to_s.similar search.to_s) < 0.50
      data_count += 1
    end
    data_count < session_trends.length ? session_trends[data_count].update(search:) : @latest_trend.save
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

  def trend_params
    params.permit(:search)
  end

  def validate_session
    session[:user_id] = SecureRandom.urlsafe_base64(16) if session[:user_id].nil?
  end
end
