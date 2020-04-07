class AddLikesToBlogPost < ActiveRecord::Migration[5.2]
  def change
    add_column :blog_posts, :likes, :integer 
  end
end
