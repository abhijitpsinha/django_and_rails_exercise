


# SEED AUTHORS
authors = ['Elon Musk', 'George Martin', 'Paulo Coelho', 'Seth Godin', 'Eric Ries']

authors.each do |author|
	first_name, last_name = author.split(' ')
	Author.where(first_name: first_name, last_name: last_name).first_or_create
end

# SEED CATEGORIES
categories = ['Science', 'Management', 'Startups', 'Space', 'Gadgets']

categories.each do |category|
	Category.where(name: category).first_or_create
end

# SEED ARTICLES
if  Article.count == 0
	count = 0

	authors.each do |author|
		first_name, last_name = author.split(' ')
		author = Author.where(first_name: first_name, last_name: last_name).first
		categories.each do |category|
			category = Category.where(name: category).first
			article  = Article.new
			article.category    = category
			article.author      = author
			article.title       = Lorem::Base.new('chars', rand(20..35)).output
			article.body        = Lorem::Base.new('paragraphs', 1).output
			article.publication = Date.today - count.send(:days)
			article.save
			count += 1
		end
	end
end