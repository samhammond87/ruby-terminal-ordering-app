def argument
    if ARGV.first == "-h" || ARGV.first == "help"
        puts
        puts "This app will help restaurants take orders from customers without the need for waitstaff"
        puts
        puts 'To start the app, simply type ruby ruby_ordering.rb'
        puts
        exit
    elsif ARGV.first == "-v" || ARGV.first == "-version"
        puts
        puts 'This is version 1.0 of Sams Ordering App'
        puts
        exit
    elsif ARGV.first == '-a' || ARGV.first == '-all'
        puts "
        -a              list all command line arguments
        -all            list all command line arguments
        -h              help
        -help           help
        -v              show version information
        -version        show version information
        "
        exit
    elsif ARGV.first != ''
        puts "Command invalid, please use -a or -all for a list of commands"
        exit
    end
end

argument