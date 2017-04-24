class ReviewMailer < ApplicationMailer

  def notify_product_review(review)
    # you can share instance variables with templates the same way we do with Rails controllers.
    @review = review
    @product = review.product
    @user = @product.user

    # this will render app/views/answers_mailer/notify_question_owner.html.erb
    # and/or app/views/answers_mailer/notify_question_owner.text.erb
    mail(to: @product.user.email, subject: "#{@review.user.first_name} reviewed your Product!") if @user
  end

end
