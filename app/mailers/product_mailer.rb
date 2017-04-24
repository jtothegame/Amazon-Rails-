class ProductMailer < ApplicationMailer

  def notify_product_owner(product)
    # you can share instance variables with templates the same way we do with Rails controllers.
    # @review = review
    @product = product
    @user = @product.user

    # this will render app/views/answers_mailer/notify_question_owner.html.erb
    # and/or app/views/answers_mailer/notify_question_owner.text.erb
    mail(to: @user.email, subject: 'You created a Product!') if @user
  end

end
