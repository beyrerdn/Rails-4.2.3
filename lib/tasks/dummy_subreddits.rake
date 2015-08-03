namespace :dummy_subreddits do
  desc "TODO"
  task generate_subreddits: :environment do
    Subreddit.new(:title => "todayilearned").save
    Subreddit.new(:title => "funny").save
    Subreddit.new(:title => "aww").save
    Subreddit.new(:title => "gif").save
  end

end
