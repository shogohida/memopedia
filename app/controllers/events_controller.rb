require 'wikipedia'
# require 'rubygems'
# require 'custodian'
# require 'news-api'
# require "unirest"
# require "times_wire"

class EventsController < ApplicationController
  # add pundit
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])

    # wikipedia
    @page = Wikipedia.find('River Plate')

    # guardian
    # Custodian.api_key = "d5f0086c-3ba2-4cbe-b39a-84ccdbc38e39"
    # @articles = Custodian::Article.find(:all, {:q => "Manchester City"})

    # news api
    # n = News.new("3370e2330c5145c8beababe2e2110742")
    # @top_headlines = n.get_top_headlines(sources: "the-verge")
    # @everything = n.get_everything(q: "Trump")
    # /v2/top-headlines
    # @top_headlines = newsapi.get_top_headlines(
    #   q: 'bitcoin',
    #   sources: 'bbc-news,the-verge',
    #   category: 'business',
    #   language: 'en',
    #   country: 'us'
    # )
    # # /v2/sources
    # @sources = newsapi.get_sources(country: 'us', language: 'en')
    # key = "3a0c733a96msh49f67135f9663e3p17b6e3jsn79111f787948"
    # q = "Trump"; #the search query
    # @response = Unirest.get "https://contextualwebsearch-websearch-v1.p.rapidapi.com/api/spelling/AutoComplete?text=#{q}",
    # headers:{
    #   "X-RapidAPI-Key": key
    # }
    # end

    # nytimes
    # TimesWire::Base.api_key = "KWwSqakiTpXxhKaIS8211GJYbEeKgWCZ"
    # @item = Item.url("http://www.nytimes.com/2013/05/04/business/economy/us-adds-165000-jobs-in-april.html")
    # @items = Item.latest('nyt')
    # @sections = Section.all
    # need to use nokogiri
    # "https://api.nytimes.com/svc/search/v2/articlesearch.json?q=election&api-key=KWwSqakiTpXxhKaIS8211GJYbEeKgWCZ"

    # FT times
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
    # contentをニューヨーク・タイムズのリンクから取る
    # need to use nokogiri
    # シードも作る？
    # keyword =.....
    # "https://api.nytimes.com/svc/search/v2/articlesearch.json?q=#{keyword}&api-key=KWwSqakiTpXxhKaIS8211GJYbEeKgWCZ"
  end

  private

  def event_params
    params.require(:event).permit(:name, :content, :year, :summary)
  end
end
