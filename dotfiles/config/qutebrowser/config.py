config.load_autoconfig(False)

c.colors.webpage.darkmode.enabled = True

# Define the color palette
bg_black = "#101010"
bg_dark = "#0a0a0a"
bg_highlight = "#141414"
fg_dim = "#555555"
fg_muted = "#6e6e6e"
fg_bright = "#888888"

# Completion menu
c.colors.completion.fg = fg_dim
c.colors.completion.odd.bg = bg_black
c.colors.completion.even.bg = bg_dark
c.colors.completion.category.fg = fg_muted
c.colors.completion.category.bg = bg_black
c.colors.completion.category.border.top = bg_black
c.colors.completion.category.border.bottom = bg_black
c.colors.completion.item.selected.fg = fg_bright
c.colors.completion.item.selected.bg = bg_highlight
c.colors.completion.item.selected.border.top = bg_highlight
c.colors.completion.item.selected.border.bottom = bg_highlight
c.colors.completion.match.fg = fg_bright
c.colors.completion.scrollbar.fg = fg_dim
c.colors.completion.scrollbar.bg = bg_black

# Statusbar
c.colors.statusbar.normal.fg = fg_dim
c.colors.statusbar.normal.bg = bg_black
c.colors.statusbar.insert.fg = fg_bright
c.colors.statusbar.insert.bg = bg_highlight
c.colors.statusbar.passthrough.fg = fg_muted
c.colors.statusbar.passthrough.bg = bg_black
c.colors.statusbar.command.fg = fg_muted
c.colors.statusbar.command.bg = bg_black
c.colors.statusbar.url.fg = fg_dim
c.colors.statusbar.url.success.http.fg = fg_dim
c.colors.statusbar.url.success.https.fg = fg_muted
c.colors.statusbar.url.hover.fg = fg_bright
c.colors.statusbar.url.error.fg = "#7a3e3e"
c.colors.statusbar.url.warn.fg = "#7a663e"

# Tabs
c.colors.tabs.bar.bg = bg_black
c.colors.tabs.odd.fg = fg_dim
c.colors.tabs.odd.bg = bg_black
c.colors.tabs.even.fg = fg_dim
c.colors.tabs.even.bg = bg_black
c.colors.tabs.selected.odd.fg = fg_bright
c.colors.tabs.selected.odd.bg = bg_highlight
c.colors.tabs.selected.even.fg = fg_bright
c.colors.tabs.selected.even.bg = bg_highlight
c.colors.tabs.pinned.odd.fg = fg_dim
c.colors.tabs.pinned.odd.bg = bg_black
c.colors.tabs.pinned.even.fg = fg_dim
c.colors.tabs.pinned.even.bg = bg_black
c.colors.tabs.pinned.selected.odd.fg = fg_bright
c.colors.tabs.pinned.selected.odd.bg = bg_highlight
c.colors.tabs.pinned.selected.even.fg = fg_bright
c.colors.tabs.pinned.selected.even.bg = bg_highlight
c.colors.tabs.indicator.start = fg_dim
c.colors.tabs.indicator.stop = fg_muted
c.colors.tabs.indicator.error = "#7a3e3e"

# Prompts & Messages
c.colors.prompts.fg = fg_muted
c.colors.prompts.bg = bg_black
c.colors.prompts.border = f"1px solid {bg_highlight}"
c.colors.prompts.selected.bg = bg_highlight
c.colors.messages.info.fg = fg_muted
c.colors.messages.info.bg = bg_black
c.colors.messages.info.border = bg_black
c.colors.messages.warning.fg = "#7a663e"
c.colors.messages.warning.bg = bg_black
c.colors.messages.warning.border = bg_black
c.colors.messages.error.fg = "#7a3e3e"
c.colors.messages.error.bg = bg_black
c.colors.messages.error.border = bg_black

# Hints (link following)
c.colors.hints.fg = fg_bright
c.colors.hints.bg = bg_black
c.colors.hints.match.fg = fg_dim
c.hints.border = f"1px solid {fg_dim}"

# Keyhint widget
c.colors.keyhint.fg = fg_dim
c.colors.keyhint.bg = bg_black
c.colors.keyhint.suffix.fg = fg_bright

# Downloads
c.colors.downloads.bar.bg = bg_black
c.colors.downloads.start.fg = fg_dim
c.colors.downloads.start.bg = bg_black
c.colors.downloads.stop.fg = fg_muted
c.colors.downloads.stop.bg = bg_black
c.colors.downloads.error.fg = "#7a3e3e"
c.colors.downloads.error.bg = bg_black

# Default webpage background (prevents white flashes on load)
c.colors.webpage.bg = bg_black

# Setup adblock
c.content.blocking.enabled = True
c.content.blocking.method = "both"  # 'auto', 'adblock', 'hosts', или 'both'
c.content.blocking.adblock.lists = [
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
    "https://secure.fanboy.co.nz/fanboy-annoyance.txt",
]
c.content.blocking.hosts.lists = [
    "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts",
]

c.fonts.default_family = "IosevkaTerm NFM"
c.fonts.default_size = "11pt"

