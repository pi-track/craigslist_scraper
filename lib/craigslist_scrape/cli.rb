class CraigslistScrape::CLI
  attr_accessor :search

  def call
    welcome
    new_search
    menu
    goodbye
  end

  def welcome
    puts "Hello - welcome to the craigslist scraper"
  end

  def menu
    input = nil
    while input != 'exit'
      puts "Enter the number of the item you'd like to see more info on or type list to see the list or search for a new search or exit:"
      input = gets.strip.downcase
      if input.to_i > 0
        puts "more info on #{input}..."
        item_info(input)
      elsif input == 'list'
        list_items
      elsif input == 'search'
        new_search
      elsif input == 'exit'
      else
        puts "not sure what you're looking for... type list or exit"
      end
    end
  end

  def goodbye
    puts "Check back for more items later!"
  end

  def new_search
    @search = CraigslistScrape::Search.new
  end

  def list_items
    @search.items.each_with_index {|b, i|
      puts "#{i+1}. #{b.name} - $#{b.price}"
    }
  end

  def item_info(index)
    i = @search.items[index.to_i-1]
    i.scrape_item_page
    i.display
  end
end
