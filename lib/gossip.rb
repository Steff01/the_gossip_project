require 'csv'

class Gossip
    attr_accessor:author
    attr_accessor:content

def initialize(author,content)
   @author= author
   @content= content
 end

    def save
        CSV.open("/home/steff/Documents/Semaine4/the_gossip_project/lib/db/gossip.csv", "a+") do |csv| csv<< [@author, @content] end
    end

    def self.all
        all_gossips = []
        CSV.read("/home/steff/Documents/Semaine4/the_gossip_project/lib/db/gossip.csv").each do |csv_line|
          all_gossips << [csv_line[0], csv_line[1]]
        end
      #{return all_gossips
      end

    def self.single(x)
       Gossip.all[x]
    end
=begin
    def self.all
        all_gossips =[]
        CSV.foreach("/home/steff/Documents/Semaine4/the_gossip_project/lib/db/gossip.csv") do |row|
          all_gossips << Gossip.new(row[0], row[1])
          end
          puts all_gossips
    end
=end


end
