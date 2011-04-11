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


class Template
    #@content
    #@tag_delimiter_start
    #@tag_delimiter_stop
    #@template_dir

    def initialize(template_dir, tag_delimiter_start="<%", tag_delimiter_stop="%>")
        @tag_delimiter_start = tag_delimiter_start
        @tag_delimiter_stop = tag_delimiter_stop
	@template_dir = template_dir
    end

    def set_content(c)
        @content = c
    end

    def get_content()
         return @content
    end

    def get_template_dir()
        return @template_dir
    end

    def clear_content()
        @content = ''
    end

    def replace_tag_str(tag, s)
        @content = @content.gsub(@tag_delimiter_start + tag + @tag_delimiter_stop, s)
    end

    def replace_tag_tpl(tag, tpl)
	tpl_content = tpl.get_content()
        replace_tag_str(tag, tpl_content)
    end

    def devour_tpl_top(tpl)
        set_content(tpl.get_content() + get_content())
    end

    def devour_tpl_bottom(tpl)
        set_content(get_content + tpl.get_content())
    end

    def load_file(file_name)
        clear_content()
        content_str = ""
        File.open(get_template_dir() + file_name).each_line do |line|
            content_str += line
        end
        set_content(content_str)
    end


    def display()
         puts get_content()
    end

end

class DivTemplate < Template
    #@class_name
    #@div_content
    #@tpl

    def initialize(template_dir, class_name)
	set_class(class_name)
        super(template_dir)
    end

    def set_class(class_name)
        @class_name = class_name   
    end

    def get_content()
        return "<div class='" + @class_name + "'>" + super() + "</div>"
    end
end
