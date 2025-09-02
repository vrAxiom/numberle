# Numberle — 5‑Digit Wordle with Target Sum

Numberle is a single-file HTML5 React web game deployed to GitHub Pages. Players guess a hidden 5-digit number in 6 tries, where each guess must match a target digit sum.

**Always reference these instructions first and fallback to search or bash commands only when you encounter unexpected information that does not match the info here.**

## Working Effectively

### Repository Overview
- **NO build system** - This is a single `index.html` file with React via CDN
- **NO Node.js dependencies** - No package.json, no npm install needed
- **NO testing framework** - Manual testing only
- **NO linting setup** - No ESLint, Prettier, or automated code quality tools

### Local Development Setup
- Start local development server: `cd /home/runner/work/numberle/numberle && python3 -m http.server 8000 --bind 127.0.0.1`
- Access application: `http://127.0.0.1:8000/`
- **Server startup time**: Immediate (< 1 second)
- **NEVER CANCEL**: No long-running commands exist in this project

### Code Changes
- Edit the single file: `index.html` (330 lines, contains entire React application)
- All game logic, UI, and styling is in this one file
- Uses React 18 UMD, Tailwind CSS CDN, and Babel Standalone for JSX
- **No compilation step needed** - Changes are immediately visible on page refresh

### Deployment
- **Automatic**: GitHub Actions deploys to GitHub Pages on every push to `main`
- **Workflow file**: `.github/workflows/pages.yml`
- **Deployment time**: 2-3 minutes via GitHub Actions
- **Manual setup scripts available**: `scripts/checkin.sh` and `scripts/deploy-gh-pages.sh`

## Validation

### Manual Testing Requirements
**ALWAYS test game functionality after making changes:**

1. **Start local server and load game**: 
   - `python3 -m http.server 8000 --bind 127.0.0.1`
   - Open `http://127.0.0.1:8000/` in browser

2. **Test complete game scenario**:
   - Set target digit sum (try 15: valid range 1-45 for 5-digit numbers)
   - Enter valid 5-digit guess that matches sum (e.g., 12345 sums to 15)
   - Verify color feedback: green=correct position, yellow=correct digit wrong position, gray=not in number
   - Test multiple guesses to win/lose scenario
   - Click "New Game" button to reset

3. **Test edge cases**:
   - Invalid inputs (4 digits, letters, numbers that don't sum correctly)
   - Minimum sum (10000 = sum 1) and maximum sum (99999 = sum 45)
   - Keyboard input vs clicking virtual keyboard

**Critical**: The application loads React, Tailwind, and Babel from CDN. In sandboxed environments, CDN resources may be blocked - this is expected and doesn't indicate a problem with your changes.

### No Automated Testing
- **No unit tests** - This project has no testing framework
- **No linting** - No ESLint or code quality automation
- **No CI validation** - Only GitHub Pages deployment occurs
- **Manual validation only** - Play the game to verify changes work

## Common Tasks

### Making Code Changes
1. Edit `index.html` directly
2. Start local server: `python3 -m http.server 8000 --bind 127.0.0.1`
3. Test changes at `http://127.0.0.1:8000/`
4. Commit and push - deployment is automatic

### Repository Structure
```
/home/runner/work/numberle/numberle/
├── index.html          # Entire application (EDIT THIS FILE)
├── README.md           # Project documentation
├── LICENSE             # MIT license
├── .nojekyll          # GitHub Pages config
├── .github/
│   └── workflows/
│       └── pages.yml   # Auto-deployment workflow
└── scripts/
    ├── checkin.sh      # Git setup script
    ├── checkin.ps1     # PowerShell version
    ├── deploy-gh-pages.sh   # Pages setup script
    └── deploy-gh-pages.ps1  # PowerShell version
```

### Key Application Components (all in index.html)
- **Game state management**: React hooks for target sum, guesses, current input
- **Number validation**: `sumDigits()` function validates guess sums match target
- **Scoring logic**: `scoreGuess()` provides color feedback (green/yellow/gray)
- **Random answer generation**: `randomAnswerForSum()` creates valid solutions
- **UI components**: Grid display, virtual keyboard, help modal

### Live Demo
- **Production URL**: https://vrAxiom.github.io/numberle/
- **Local development**: http://127.0.0.1:8000/ (after starting Python server)

## Critical Reminders
- **This is NOT a typical Node.js project** - No npm, no build, no dependencies
- **Single file editing**: All changes go in `index.html`
- **Manual testing essential**: Always play the game after changes
- **CDN dependencies**: React/Tailwind load from external CDNs
- **GitHub Pages deployment**: Automatic on push to main branch
- **No timeouts needed**: All commands complete in seconds, no long-running processes

## Troubleshooting
- **Game doesn't load locally**: Ensure Python HTTP server is running on correct port
- **CDN errors in browser**: Expected in sandboxed environments, doesn't affect functionality
- **Changes don't appear**: Hard refresh browser (Ctrl+F5) to bypass cache
- **Deployment issues**: Check GitHub Actions tab for workflow status