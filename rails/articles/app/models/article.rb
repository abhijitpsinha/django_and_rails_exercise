class Article < ActiveRecord::Base
  attr_accessible :author, :body, :category, :hero_image_url, 
    :optional_image_url, :publication, :title

  belongs_to :category
  belongs_to :author

  default_scope { published_till_today }

  def self.published_till_today
  	where("publication <= (?)", Date.today)
  end

  def self.featured
  	order("RAND()").first
  end

  def self.non_featured(featured_article_id)
  	skip_articles([featured_article_id])
  end

  def self.next_reads(ids)
  	skip_articles(ids).limit(4)
  end

  def self.skip_articles(skipped_ids)
  	where("id NOT IN (?)", skipped_ids)
  end
end
