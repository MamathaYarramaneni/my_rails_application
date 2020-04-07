class StaticPagesController < ApplicationController
 def index 
  @blogs=BlogPost.all
 end
end
