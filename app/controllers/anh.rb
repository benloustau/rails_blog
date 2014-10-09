# comments controller rb file

class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @comment = Comment.new
    @comment.body = params[:comment][:body]
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]

    if @comment.save
      render partial: 'users/comment', formats: [:html], locals: { comment: @comment }
    end
  end

  # js file

  $(document).ready(function(){

  $('.comment-form form').submit(function(event){
    event.preventDefault();
    params = $(this).serialize();
    url = $(this).attr('action')

    $.post(url, params, function(data) {
      $('.comment-list').append(data);
    });
  });

});