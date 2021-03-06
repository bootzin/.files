# Autogenerated config.py
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Uncomment this to still load settings configured via autoconfig.yml
config.load_autoconfig()

# Aliases for commands. The keys of the given dictionary are the
# aliases, while the values are the commands they map to.
# Type: Dict
c.aliases = {'w': 'session-save', 'q': 'quit', 'wq': 'quit --save'}

# Require a confirmation before quitting the application.
# Type: ConfirmQuit
# Valid values:
#   - always: Always show a confirmation.
#   - multiple-tabs: Show a confirmation if multiple tabs are opened.
#   - downloads: Show a confirmation if downloads are running
#   - never: Never show a confirmation.
c.confirm_quit = ['never']

# How to open links in an existing instance if a new one is launched.
# This happens when e.g. opening a link from a terminal. See
# `new_instance_open_target_window` to customize in which window the
# link is opened in.
# Type: String
# Valid values:
#   - tab: Open a new tab in the existing window and activate the window.
#   - tab-bg: Open a new background tab in the existing window and activate the window.
#   - tab-silent: Open a new tab in the existing window without activating the window.
#   - tab-bg-silent: Open a new background tab in the existing window without activating the window.
#   - window: Open in a new window.
c.new_instance_open_target = 'tab'

# Load a restored tab as soon as it takes focus.
# Type: Bool
c.session.lazy_restore = True

# Always restore open sites when qutebrowser is reopened.
# Type: Bool
c.auto_save.session = True

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'file://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# Number of commands to save in the command history. 0: no history / -1:
# unlimited
# Type: Int
c.completion.cmd_history_max_items = 2048

# Height (in pixels or as percentage of the window) of the completion.
# Type: PercOrInt
c.completion.height = '30%'

# Execute the best-matching command on a partial match.
# Type: Bool
c.completion.use_best_match = True

# Directory to save downloads to. If unset, a sensible OS-specific
# default is used.
# Type: Directory
c.downloads.location.directory = '~/Downloads'

# Duration (in milliseconds) to wait before removing finished downloads.
# If set to -1, downloads are never removed.
# Type: Int
c.downloads.remove_finished = 500

# Automatically enter insert mode if an editable element is focused
# after loading the page.
# Type: Bool
c.input.insert_mode.auto_load = False

# Leave insert mode if a non-editable element is clicked.
# Type: Bool
c.input.insert_mode.auto_leave = False

# Enable smooth scrolling for web pages. Note smooth scrolling does not
# work with the `:scroll-px` command.
# Type: Bool
c.scrolling.smooth = False

# Hide the statusbar unless a message is shown.
# Type: Bool
c.statusbar.hide = False

# Open new tabs (middleclick/ctrl+click) in the background.
# Type: Bool
c.tabs.background = True

# How to behave when the last tab is closed.
# Type: String
# Valid values:
#   - ignore: Don't do anything.
#   - blank: Load a blank page.
#   - startpage: Load the start page.
#   - default-page: Load the default page.
#   - close: Close the window.
c.tabs.last_close = 'close'

# Which tab to select when the focused tab is removed.
# Type: SelectOnRemove
# Valid values:
#   - prev: Select the tab which came before the closed one (left in horizontal, above in vertical).
#   - next: Select the tab which came after the closed one (right in horizontal, below in vertical).
#   - last-used: Select the previously selected tab.
c.tabs.select_on_remove = 'last-used'

# When to show the tab bar.
# Type: String
# Valid values:
#   - always: Always show the tab bar.
#   - never: Always hide the tab bar.
#   - multiple: Hide the tab bar if only one tab is open.
#   - switching: Show the tab bar when switching tabs.
c.tabs.show = 'multiple'

# Open base URL of the searchengine if a searchengine shortcut is
# invoked without parameters.
# Type: Bool
c.url.open_base_url = True

# Search engines which can be used via the address bar. Maps a search
# engine name (such as `DEFAULT`, or `ddg`) to a URL with a `{}`
# placeholder. The placeholder will be replaced by the search term, use
# `{{` and `}}` for literal `{`/`}` signs. The search engine named
# `DEFAULT` is used when `url.auto_search` is turned on and something
# else than a URL was entered to be opened. Other search engines can be
# used by prepending the search engine name to the search term, e.g.
# `:open google qutebrowser`.
# Type: Dict
c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}', 'i': 'https://duckduckgo.com/?q={}&iar=images&iax=images&ia=images', 'red': 'https://reddit.com/r/{}', 'wt': 'http://en.wiktionary.org/?search={}', 'osm': 'http://www.openstreetmap.org/search?query={}', 'art': 'http://arizona.summon.serialssolutions.com/search?q={}', 'book': 'http://sabio.library.arizona.edu/search/X?SEARCH={}', 'lib': 'http://gen.lib.rus.ec/search.php?req={}', 'tpb': 'http://thepiratebay.org/search/{}', 'laincat': 'http://lainchan.org/{}/catalog.html', 'tw': 'https://twitter.com/{}', '8': 'https://8ch.net/{}', 'eb': 'https://ebay.com/sch/{}', 'etym': 'http://etymonline.com/index.php?allowed_in_frame=0&search={}', 'ddg': 'https://duckduckgo.com/?q={}&t=ha&iar=images', 'aw': 'https://wiki.archlinux.org/index.php?title=Special%3ASearch&search={}', '4cat': 'https://boards.4chan.org/{}/catalog', 'lain': 'http://lainchan.org/{}', 'gw': 'https://wiki.gentoo.org/index.php?title=Special%3ASearch&search={}', '8cat': 'https://8ch.net/{}/catalog.html', 'yt': 'https://www.youtube.com/results?search_query={}', 'ig': 'https://wiki.installgentoo.com/index.php?search={}&title=Special%3ASearch', 'w': 'https://www.wikipedia.org/search-redirect.php?family=wikipedia&language=en&search={}&language=en&go=Go', '4': 'https://boards.4chan.org/{}', 'sk': 'https://www.skytorrents.in/search/all/ed/1/?l=en-us&q={}', 'vw': 'http://vim.wikia.com/wiki/Special:Search?fulltext=Search&query={}', 'thw': 'http://www.thinkwiki.org/w/index.php?search={}&title=Special%3ASearch', 'bc': 'https://www.bitchute.com/search?q={}&sort=date_created%20desc'}

# This setting can be used to map keys to other keys. When the key used
# as dictionary-key is pressed, the binding for the key used as
# dictionary-value is invoked instead. This is useful for global
# remappings of keys, for example to map Ctrl-[ to Escape. Note that
# when a key is bound (via `bindings.default` or `bindings.commands`),
# the mapping is ignored.
# Type: Dict
c.bindings.key_mappings = {'<Ctrl+[>': '<Escape>', '<Ctrl+6>': '<Ctrl+^>', '<Ctrl+m>': '<Return>', '<Ctrl+j>': '<Return>', '<Shift+Return>': '<Return>', '<Enter>': '<Return>', '<Shift+Enter>': '<Return>', '<Ctrl+Enter>': '<Ctrl+Return>'}

# Bindings for normal mode
config.bind('+', 'zoom-in')
config.bind(';D', 'set downloads.location.directory ~/Downloads ;; hint links download')
config.bind(';E', 'set downloads.location.directory ~/Ella ;; hint links download')
config.bind(';S', 'set downloads.location.directory ~/Software ;; hint links download')
config.bind(';cf', 'set downloads.location.directory ~/.config ;; hint links download')
config.bind(';d', 'set downloads.location.directory ~/Documents ;; hint links download')
config.bind(';m', 'set downloads.location.directory ~/Music ;; hint links download')
config.bind(';pp', 'set downloads.location.directory ~/Pictures ;; hint links download')
config.bind(';s', 'set downloads.location.directory ~/Software/scripts ;; hint links download')
config.bind(';vv', 'set downloads.location.directory ~/Videos ;; hint links download')
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
config.bind('j', 'run-with-count 2 scroll down')
config.bind('k', 'run-with-count 2 scroll up')
config.source('shortcuts.py')
