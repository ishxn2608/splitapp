# How to Push This Project to GitHub

## Step 1: Initialize Git (if not already done)
```bash
git init
```

## Step 2: Add All Files
```bash
git add .
```

## Step 3: Create Initial Commit
```bash
git commit -m "Initial commit: SplitApp - MERN Stack Expense Splitting Application"
```

## Step 4: Create GitHub Repository

### Option A: Using GitHub CLI (gh)
```bash
# Install GitHub CLI if not installed: https://cli.github.com/

# Login to GitHub
gh auth login

# Create repository
gh repo create SplitApp --public --source=. --remote=origin --push
```

### Option B: Using GitHub Website
1. Go to https://github.com/new
2. Repository name: `SplitApp`
3. Description: `A MERN stack group expense splitting application - Splitwise clone`
4. Choose Public or Private
5. **DO NOT** initialize with README (we already have one)
6. Click "Create repository"

## Step 5: Connect to GitHub Repository
```bash
# Replace YOUR_USERNAME with your GitHub username
git remote add origin https://github.com/YOUR_USERNAME/SplitApp.git

# Or use SSH
git remote add origin git@github.com:YOUR_USERNAME/SplitApp.git
```

## Step 6: Push to GitHub
```bash
# Push to main branch
git branch -M main
git push -u origin main
```

## Step 7: Verify
Visit your repository at: `https://github.com/YOUR_USERNAME/SplitApp`

## Future Updates

After making changes:
```bash
git add .
git commit -m "Description of changes"
git push
```

## Create Branches for Features
```bash
# Create and switch to new branch
git checkout -b feature/new-feature

# Make changes, then commit
git add .
git commit -m "Add new feature"

# Push branch
git push -u origin feature/new-feature

# Create Pull Request on GitHub
```

## Useful Git Commands
```bash
# Check status
git status

# View commit history
git log --oneline

# Undo last commit (keep changes)
git reset --soft HEAD~1

# Discard all local changes
git reset --hard HEAD

# Pull latest changes
git pull origin main
```

## .gitignore Already Configured
The following are already excluded:
- node_modules/
- .env
- logs/
- build files
- OS files (.DS_Store)

## Repository Settings Recommendations

### Add Topics (on GitHub)
- mern-stack
- expense-tracker
- splitwise-clone
- react
- nodejs
- mongodb
- expense-management

### Enable GitHub Pages (Optional)
If you want to host documentation:
1. Go to Settings → Pages
2. Select branch: main
3. Folder: /docs or root

### Add Repository Description
"A full-stack MERN application for splitting group expenses with analytics. Features include group management, expense tracking, balance settlement, and visual spending insights."

### Add Website URL
Add your live demo URL (Render/Heroku deployment)

## Collaboration

### Invite Collaborators
Settings → Collaborators → Add people

### Protect Main Branch
Settings → Branches → Add rule
- Require pull request reviews
- Require status checks to pass

## License
This project uses MIT License (already included in README.md)
