class FeedbackMailer < ApplicationMailer
  default to: "alina.moskieva@flatstak.com"

  def feedback(feedback)
    @feedback = feedback
    mail from: @feedback.email, subject: @feedback.subject, body: @feedback.content
  end
end
