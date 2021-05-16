module Resource
  def connection(routes)
    if routes.nil?
      puts "No route matches for #{self}"
      return
    end

    loop do
      print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
      verb = gets.chomp
      break if verb == 'q'

      action = nil

      if verb == 'GET'
        print 'Choose action (index/show) / q to exit: '
        action = gets.chomp
        break if action == 'q'
      end
      action.nil? ? routes[verb].call : routes[verb][action].call
    end
  end
end

class PostsController
  extend Resource

  attr_reader :posts

  def initialize
    @@posts = []
  end

  def index
    @@posts.each_with_index do |item, index|
      print "#{index}. #{item}.\n"
    end
  end

  def show
    puts "Введите индекс поста, который выхотите вывести."
    id = gets.to_i
    print "#{id}. #{@@posts[id]}.\n"
  end

  def create
    puts "Введите текст поста"
    text = gets.chomp
    @@posts.push(text)
  end

  def update
    puts "Введите индекс элемента, который хотите обновить."
    id = gets.to_i
    puts "Введите новый текст поста"
    new_text = gets.chomp
    @@posts[id] = new_text
    print "#{id}. #{@@posts[id]}.\n"
  end

  def destroy
    puts "Введите индекс элемента, который хотите удалить."
    id = gets.to_i
    @@posts.delete_at(id)
  end

end

class CommentsController < PostsController
  extend Resource

  def initialize()
    @@posts_with_comments = []
  end

  def index
    @@posts_with_comments.each do |item|
      print "#{item[0]}. Post: #{item[1]}. Comment: #{item[2]}\n"
    end
  end

  def show
    puts "Введите индекс поста, который выхотите вывести."
    id = gets.to_i
      print "#{@@posts_with_comments[id][0]}. Post: #{@@posts_with_comments[id][1]}. Comment: #{@@posts_with_comments[id][2]}\n"
  end

  def create
    puts "Введите индекс поста, к которому хотите оставить комментарий."
    id = gets.to_i
    puts "Введите текст комментария."
    text = gets.chomp
    info = @@posts[id]
    new_info = [id, info, text]
    @@posts_with_comments.push(new_info)
    @@posts_with_comments.sort_by!{|elem| elem[0]}
  end

  def update
    puts "Введите индекс элемента, который хотите обновить."
    id = gets.to_i
    puts "Введите новый текст поста"
    new_text = gets.chomp
    @@posts_with_comments[id][2] = new_text
    print "#{id}. #{@@posts_with_comments[id]}.\n"
  end

  def destroy
    puts "Введите индекс элемента, который хотите удалить."
    id = gets.to_i
    @@posts_with_comments.delete_at(id)
  end
end

class Router
  def initialize
    @@routes = {}
  end

  def init
    resources(PostsController, 'posts')
    resources(CommentsController, 'comments')
    loop do
      print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
      choise = gets.chomp
      PostsController.connection(@@routes['posts']) if choise == '1'
      CommentsController.connection(@@routes['comments']) if choise == '2'
      break if choise == 'q'
    end
    puts 'Good bye!'
  end

  def resources(klass, keyword)
    controller = klass.new
    @@routes[keyword] = {
      'GET' => {
        'index' => controller.method(:index),
        'show' => controller.method(:show)
      },
      'POST' => controller.method(:create),
      'PUT' => controller.method(:update),
      'DELETE' => controller.method(:destroy)
    }
  end
end

router = Router.new
router.init
