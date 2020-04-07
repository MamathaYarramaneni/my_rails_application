class AddBlogPostToComment < ActiveRecord::Migration[5.2]
  def change
     add_column :comments, :blog_post_id, :integer
  end
end
