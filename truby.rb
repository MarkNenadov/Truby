# TRuby - by Mark J. Nenadov, 2011
#
# A simple Ruby web template engine.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.



require "constants.rb"
require "lib/templating.rb"

class Truby
    #@templates
    #@template_dir

    def initialize(template_dir)
        @templates = Array.new
	@template_dir = template_dir
    end

    def get_content
        tpl_str = ""
        @templates.each {|template| tpl_str += template.get_content}        
	return tpl_str
    end

    def get_new_template()
        return Template.new(@template_dir)
    end

    def replace_tag_str(tag, tpl)
        @templates.each {|template| template.replace_tag_str(tag, tpl)}
    end

    def replace_tag_tpl(tag, tpl)
        @templates.each {|template| template.replace_tag_tpl(tag, tpl)}
    end

    def load_tpl(tpl)
        @templates.push tpl
    end

    def sort
    end
    
    def display
        puts get_content
    end

end

## MAIN ##

puts "Sample / Test #1 (three independant templates):"

tpl_engine = Truby.new

header = tpl_engine.get_new_template()
header.load_file("header.tpl")

index = tpl_engine.get_new_template()
index.load_file("index.tpl")

footer = tpl_engine.get_new_template()
footer.load_file("footer.tpl")

tpl_engine.load_tpl( header )
tpl_engine.load_tpl( index )
tpl_engine.load_tpl( footer )

tpl_engine.display()

puts "Sample / Test #2 (three templates, two of which get swapped into the third):"

tpl_engine = Truby.new

header = tpl_engine.get_new_template()
header.load_file("header.tpl")

index = tpl_engine.get_new_template()
index.load_file("index.tpl")

footer = tpl_engine.get_new_template()
footer.load_file("footer.tpl")

tpl_engine.load_tpl( index )
tpl_engine.replace_tag_tpl("header", header)
tpl_engine.replace_tag_tpl("footer", footer)

tpl_engine.display()

puts "Sample / Test #3 (basically the same as #2, except it does it with the devour_tpl_* methods):"

tpl_engine = Truby.new

header = tpl_engine.get_new_template()
header.load_file("header.tpl")

index = tpl_engine.get_new_template()
index.load_file("index.tpl")

footer = tpl_engine.get_new_template()
footer.load_file("footer.tpl")

index.devour_tpl_top(header)
index.devour_tpl_bottom(footer)

tpl_engine.load_tpl( index )

tpl_engine.display()

