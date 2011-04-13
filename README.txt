Truby - A simple Ruby web template engine.

INTRODUCTON

With Truby, you can do things like the following to
output an HTML file to the browser:

>> tpl_engine = Truby.new
>> 
>> header = tpl_engine.get_new_template()
>> header.load_file("header.tpl")
>> 
>> index = tpl_engine.get_new_template()
>> index.load_file("index.tpl")
>> 
>> footer = tpl_engine.get_new_template()
>> footer.load_file("footer.tpl")
>> 
>> tpl_engine.load_tpl( index )
>> tpl_engine.replace_tag_tpl("header", header)
>> tpl_engine.replace_tag_tpl("footer", footer)
>> tpl_engine.replace_tag_str("user", "John Q Public")
>> tpl_engine.replace_tag_str("status", "Hired")
>> tpl_engine.display()

It's much better to use a MVC framework like Rails, however, there are
some cases where that might not be possible. Perhaps you may have to
make a Ruby site interfacing with (gasp) CGI. In cases like that, Truby 
can be really handy.

TODO

This templating engine is currently missing (at least):

- A way to do looping and block replaces
- Handy preset HTML templates

AUTHOR

(c) Mark J. Nenadov, 2011 <marknenadov@gmail.com>


LICENSING

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.


