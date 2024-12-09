# 🔐 Cross-Platform Password Generator

A lightning-fast, secure password generator that works seamlessly across Windows, macOS, and Linux. Generate cryptographically secure passwords with customizable lengths from 12 to 512 characters.

![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)
![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20macOS%20%7C%20Linux-blue)
![Shell](https://img.shields.io/badge/shell-bash-89e051)

## ✨ Features

- 🌍 **Cross-Platform Compatibility**: Works on Windows, macOS, and Linux
- 🔒 **Secure Generation**: Uses `/dev/urandom` on Unix systems with secure fallback for Windows
- 📏 **Flexible Length**: Generate passwords from 12 to 512 characters
- 🎯 **Smart Defaults**: Sensible 16-character default length
- 🧩 **Character Diversity**: Includes uppercase, lowercase, numbers, and special characters
- 💨 **Blazing Fast**: Generates passwords instantly
- 📚 **Built-in Help**: Comprehensive help system with examples

## 🚀 Quick Start

1. Clone the repository or download the script
2. Make it executable:
   ```bash
   chmod +x generate_password.sh
   ```
3. Run it:
   ```bash
   ./generate_password.sh
   ```

## 💻 Usage

```bash
# Generate default 16-character password
./generate_password.sh

# Generate custom length password (e.g., 32 characters)
./generate_password.sh 32

# Show help
./generate_password.sh --help
```

## 📖 Examples

```bash
$ ./generate_password.sh
q,/M-OUG,7#ei3T:    # 16 characters (default)

$ ./generate_password.sh 32
Kj#9f@mP2$nL5vX8&qR4wY7*hN3cA!bE  # 32 characters

$ ./generate_password.sh 12
Ht7$mK9v@pL2    # 12 characters (minimum)
```

## 🔧 Technical Details

The script uses two methods for generating passwords:

1. Primary Method (Unix-like systems):
   - Uses `/dev/urandom` for cryptographically secure random generation
   - Filtered through `tr` for character selection

2. Fallback Method (Windows):
   - Uses Bash's `$RANDOM` with modular arithmetic
   - Implements secure character selection algorithm

## 🤝 Contributing

Contributions are welcome! Feel free to:
- Open issues for bugs or suggestions
- Submit pull requests for improvements
- Share the tool with others

## 📱 Connect

Follow [@HxHippy](https://x.com/HxHippy) for updates and more tools!

## 📄 License

MIT License

Copyright (c) 2024 HxHippy

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
