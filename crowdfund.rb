#crowdfund (File created 8:43PM on 5/8/22)
#end of day one is 8:24pm-10:47pm 5/8/22
#day two is 5:45pm - .... 9pm 5/24/22
#day three is 9:55pm - .... 11:15pm 6/8/22 (oof)
#day four is 7:30pm - 8:30pm, resumed at 9:40pm - 1AM  6/14/22 
#day five is 12:45pm - 1:30pm before work 6/15/22 
#day six is 12am - 7:05AM 7 hours straight 6/18/22 

require_relative 'collection' # calls the collection class file 
require_relative 'project' # calls the project class file 
require_relative 'die'

project1 = Project.new('ABC', -30, 25500)
project2 = Project.new('LMN', 2000)
project3 = Project.new('XYZ', 100, 30000)

my_collection = Collection.new("Jamie's collection of projects")
my_collection.add_project(project1)
my_collection.add_project(project2)
my_collection.add_project(project3)
my_collection.run_projects(2)



