# yazi-plugin-doxx

A [yazi](https://yazi-rs.github.io) previewer plugin for `.docx` files using [doxx](https://github.com/bgreenwell/doxx).

## Requirements

- [yazi](https://yazi-rs.github.io) 0.3+
- [doxx](https://github.com/bgreenwell/doxx) installed and on your `$PATH`

## Installation

Clone into your yazi plugins directory:

```bash
git clone https://github.com/bgreenwell/yazi-plugin-doxx \
  ~/.config/yazi/plugins/yazi-plugin-doxx.yazi
```

## Setup

Add the following to your `~/.config/yazi/yazi.toml`:

```toml
[plugin]
prepend_previewers = [
  { mime = "application/vnd.openxmlformats-officedocument.wordprocessingml.document", run = "yazi-plugin-doxx" },
]
```

## License

MIT
