# doxx.yazi

A [yazi](https://yazi-rs.github.io) previewer plugin for `.docx` files using [doxx](https://github.com/bgreenwell/doxx).

## Requirements

- [yazi](https://yazi-rs.github.io) 0.3+
- [doxx](https://github.com/bgreenwell/doxx) installed and on your `$PATH`

## Installation

```bash
ya pkg add bgreenwell/doxx
```

Or manually:

```bash
git clone https://github.com/bgreenwell/doxx.yazi \
  ~/.config/yazi/plugins/doxx.yazi
```

## Setup

Add the following to your `~/.config/yazi/yazi.toml`:

```toml
[plugin]
prepend_previewers = [
  { mime = "application/vnd.openxmlformats-officedocument.wordprocessingml.document", run = "doxx" },
]
```

## License

MIT
