module GPodder
  class Client
    def top_tags(count)
      get("/api/2/tags/#{count}.json")
    end

    def tag(name, count)
      get("/api/2/tag/#{name}/#{count}.json")
    end

    def podcast(url)
      get("/api/2/data/podcast.json", url: url)
    end

    def episode(podcast_url, episode_url)
      get("/api/2/data/episode.json",
          "podcast-url": podcast_url,
          "episode-url": episode_url)
    end

    def toplist(count, scale_logo = 64)
      get("/toplist/#{count}.json", scale_logo: scale_logo)
    end

    def search(query, scale_logo = 64)
      get("/search.json", q: query, scale_logo: scale_logo)
    end
  end
end
