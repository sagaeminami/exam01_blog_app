class BlogMailer < ApplicationMailer
  def blog_mail(blog)
  @blog = blog

  mail to: "gw.feltmyheart@gmail.com",
       subject: "投稿の確認メール"
  end
end
