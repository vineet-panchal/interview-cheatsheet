# 🐧 Linux Cheat Sheet

A quick reference guide for Linux commands and concepts, useful for interviews and daily development.

---

## 📁 File & Directory Commands

| Command | Description |
|--------|-------------|
| `ls -al` | List all files (detailed view) |
| `cd [dir]` | Change directory |
| `pwd` | Show current directory |
| `mkdir [dir]` | Create a directory |
| `touch [file]` | Create a file |
| `rm [file]` | Delete a file |
| `rm -r [dir]` | Delete a directory recursively |
| `cp [src] [dest]` | Copy file or directory |
| `mv [src] [dest]` | Move or rename |

---

## 🛠 File Permissions

| Command | Description |
|--------|-------------|
| `chmod +x file.sh` | Make file executable |
| `chmod 755 file` | Set read/write/execute (owner), read/execute (group/others) |
| `chown user:group file` | Change file ownership |

**Permission Notation:**
- `r` = read, `w` = write, `x` = execute
- `ls -l` output example: `-rwxr-xr--` (owner/group/other)

---

## 🔍 Searching & Viewing

| Command | Description |
|--------|-------------|
| `cat file.txt` | Print file contents |
| `less file.txt` | Scroll through file |
| `head -n 10 file.txt` | First 10 lines |
| `tail -n 10 file.txt` | Last 10 lines |
| `grep "text" file.txt` | Search for text in a file |
| `find . -name "*.py"` | Find files with pattern |
| `wc -l file.txt` | Count lines |

---

## ⚙️ Process Management

| Command | Description |
|--------|-------------|
| `ps aux` | Show all processes |
| `top` / `htop` | Real-time process monitor |
| `kill [PID]` | Terminate process |
| `kill -9 [PID]` | Force kill |
| `&` | Run command in background |
| `jobs` | Show background jobs |
| `fg` | Bring job to foreground |

---

## 🔗 Networking

| Command | Description |
|--------|-------------|
| `ping google.com` | Check network connection |
| `curl https://example.com` | Fetch URL |
| `wget URL` | Download file |
| `netstat -tuln` | List open ports |
| `ifconfig` / `ip addr` | Show network interfaces |

---

## 📦 Package Management (Debian/Ubuntu)

| Command | Description |
|--------|-------------|
| `sudo apt update` | Update package lists |
| `sudo apt upgrade` | Upgrade packages |
| `sudo apt install [pkg]` | Install a package |
| `sudo apt remove [pkg]` | Remove a package |

---

## 💬 Miscellaneous

| Command | Description |
|--------|-------------|
| `echo $HOME` | Print environment variable |
| `export VAR=value` | Set environment variable |
| `man [command]` | Manual for a command |
| `history` | Show command history |
| `alias gs='git status'` | Create command alias |

---

## 🧠 Tips for Interviews

- Understand file permissions and ownership.
- Know how to navigate and manage files.
- Be ready to debug with `ps`, `top`, and `grep`.
- Basic piping: `cat file | grep "word" | wc -l`
- Practice writing and executing a simple Bash script.

---

