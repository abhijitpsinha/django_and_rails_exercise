class ArticlesController < ApplicationController
  def index
  	@featured     = Article.featured
  	@article_list = Article.non_featured(@featured.id).limit(3)
  	@next_reads   = Article.next_reads([@featured.id, @article_list.pluck(:id)].flatten)
  end

  def show
  	@article = Article.where(id: params[:id]).first
  	@next_reads  = Article.next_reads([@article.id])
  end
end
