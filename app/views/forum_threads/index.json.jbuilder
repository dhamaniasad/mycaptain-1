json.array!(@forum_threads) do |forum_thread|
  json.extract! forum_thread, :id, :title
  json.url forum_thread_url(forum_thread, format: :json)
end
