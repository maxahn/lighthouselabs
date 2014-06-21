module LightBrow
  class Browser





    def run
    @origin_position = History.order(:created_at).select(:id).map { |x| x.id}.count

    @current_position = @origin_position

    @ordered_list = History.order(:created_at).select(:id).map { |x| x.id}
      welcome
      loop do
        input
        break if quit?
        handle
      end
    end

    # def self.ordered_history_ids
    #   History.order(:created_at).select(:id).map { |x| x.id}.count
    # end

    private



    def welcome
      menu = <<-menutext
Welcome to Lighthouse Browser - Aka LightBrow
      menutext
      puts menu.colorize(:yellow)
      help
    end

    def help
      help = <<-helptext
COMMANDS:
\\? - help text
\\q - quit
\\h - history
\\b - back
\\f - forward
      helptext
      puts help.colorize(:blue)
    end

    def handle
      if command?
        handle_command
      else
        visit(@input)
      end
    end

    def command?
      @input.start_with? '\\'
    end

    def handle_command
      case @input
      when '\\?' # \?
        help
      when '\\h' # \h
        history
      when '\\b' # \b
        back
      when '\\f' # \f
        forward
      end
    end




    def history

      History.order(:created_at).each do |url|
        puts url[:url].inspect.white.on_red.blink
      end
    end

    def back
      if @current_position == 0
        puts "Can't go back in time! You are already at the beginning of all time!".white.on_red.blink
      else
        @current_position -= 1
        id = @ordered_list[@current_position]
        puts id
        url = History.find(id).url
        visit(url)
      end
    end

    def forward
      if @current_position == @origin_position
        puts "Can't go forward in time!".white.on_red.blink
      elsif @current_position + 1 == @origin_position
        @current_position += 1
        puts "Can't go foward in time!".white.on_red.blink
      else
        @current_position += 1
        id = @ordered_list[@current_position]
        puts id
        url = History.find(id).url
        visit(url)
      end
    end

    def create_history?
      @current_position == History.order(:created_at).select(:id).map { |x| x.id}.count
    end

    def visit(url)

      if response = fetch(url)
        
        if create_history?
          History.create(url: url)
        end
        @page = HTMLPage.new(response)
        display
      else
        puts " ! Invalid URL ! ".black.on_red
      end
    end

    # TODO: Implement me
    # Try to fetch the given url using Net::HTTP
    # If the URL is invalid, it should not bother fetching the URL and instead just return nil
    def fetch(url)
      uri = URI.parse(url)
      begin
        Net::HTTP.get(uri)# ...
      rescue SocketError, Errno::ECONNREFUSED
        return nil
      end
      
    end

    def display

      print_info "Title", @page.title
      print_info "Description", @page.description
      print_info "Links"
      begin
        @page.links.each_with_index do |link, i|
          puts "#{i}. #{link}"
        end
      rescue NoMethodError
        return nil
      end
    end

    def menu
      puts "--".colorize(:blue)
      puts "Where to next?"
      print "url> ".colorize(:blue)
    end

    def input 
      menu
      @input = gets.chomp
    end

    def quit?
      @input == '\q'
    end

    def print_info(label, value=nil)
      print "#{label}: ".colorize(:red)
      puts value
    end

  end

end
