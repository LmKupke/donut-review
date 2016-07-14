class ReviewMailer < ApplicationMailer
  def new_review(review)
    # Build the email in here..
    @review = review

    mail(
      to: review.donut.user.email,
      subject: "New Review for #{review.donut.name}"
    )
  end
end
