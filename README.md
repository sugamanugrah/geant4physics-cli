# GEANT4PHYSICS

An interactive setup tool to bootstrap a new Geant4 simulation project from a template — no manual renaming of `PROJECT_NAME`, executables, or source files required.

Run one command, answer a couple of prompts, and get a ready-to-build Geant4 project.

---

## What it does

Running `GEANT4PHYSICS` will:

1. Ask for your **Project Name**.
2. Ask whether you want to change the **executable name** (`Y`/`N`) — if `N`, it keeps the template default (`next`).
3. Show a summary and ask for final confirmation before doing anything.
4. Clone the [Geant4 project template](https://github.com/sugamanugrah/PROJECT_NAME) into a new folder named after your project.
5. Remove the template's `.git` history so you start with a clean repo.
6. Replace every `PROJECT_NAME` placeholder across `CMakeLists.txt`, `.mac` files, `.cc`, `.hh`, `.in`, `.out`.
7. Rename the executable and its associated files — only if you chose to change it.
8. Create an empty `build/` directory, ready for CMake.

---

## Installation

### Option A — One-line install (recommended, for use on any PC)

```bash
curl -fsSL https://raw.githubusercontent.com/sugamanugrah/geant4physics-cli/main/install.sh | bash
```

This downloads `GEANT4PHYSICS`, places it in `~/bin`, makes it executable, and adds `~/bin` to your `PATH`. Restart your terminal (or run `source ~/.bashrc`) afterward.

### Option B — Manual install

```bash
mkdir -p ~/bin
mv GEANT4PHYSICS ~/bin/
chmod +x ~/bin/GEANT4PHYSICS

echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

Verify installation:

```bash
which GEANT4PHYSICS
```

### Windows / WSL note

If the script was ever opened in Notepad, it may carry Windows-style (`CRLF`) line endings, causing:

```
/usr/bin/env: ‘bash\r’: No such file or directory
```

Fix it with:

```bash
sed -i 's/\r$//' ~/bin/GEANT4PHYSICS
```

---

## Usage

From any directory:

```bash
GEANT4PHYSICS
```

### Example run

Below is a real run — project named `PBB1`, executable name left unchanged:

```
==================================================
        GEANT4PHYSICS — Project Setup
==================================================

Enter your Project Name (e.g. MySimulation): PBB1
Do you want to change the executable name? (Y/N): n
➜ Keeping default executable name: 'next'

Summary:
  Project Name     : PBB1
  Executable Name  : next
  Target Directory : ./PBB1

Proceed with setup? (Y/n): y

➜ Cloning template repo into 'PBB1'...
✔ Repo cloned.
➜ Renaming project references to 'PBB1'...
✔ Project name updated.
➜ Executable name unchanged ('next').
✔ Build directory created.

==================================================
  Setup complete!
==================================================

Project 'PBB1' is ready in: ./PBB1

```

If you answer `Y` to the executable prompt instead, you'll additionally be asked for a new executable name, and the summary/next-steps will reflect that name (e.g. `./mydet` instead of `./next`).

---

## Generated project structure

```
PBB1/
├── build/              # created automatically
├── include/            # header files (.hh)
├── src/                # source files (.cc)
├── CMakeLists.txt      # build configuration
├── init_vis.mac        # visualization init
├── next.cc             # contains main() (renamed if you chose to)
├── next.in             # sample input
├── next.out            # sample output
├── run.mac             # batch-mode execution
└── vis.mac             # visualization macro
```

---

## Requirements

- `git`
- `bash`
- A working [Geant4](https://geant4.web.cern.ch/) installation

---



## Notes

- Edit the `REPO_URL` variable inside the script to point at a different template repository.
- The script runs with `set -e` — it stops immediately on the first failure (e.g. failed clone).
- Edit the script using `nano`, `vim`, or VS Code with LF line endings — avoid Notepad.
- If a folder with the chosen project name already exists, the script will ask before overwriting it.

---

## License

Add your license here.
