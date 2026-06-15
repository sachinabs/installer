#!/bin/bash

### ========================================= ###
### AUTO RANDOM GITHUB + NPM DOWNLOAD SCRIPT ###
### ========================================= ###

### ========== CONFIG ========== ###
REPO_URL="https://github.com/sachinabs/random_repo.git"
REPO_DIR="$HOME/random_repo"
QUOTE_FILE="quote.txt"

# Random commit count (1 to 4)
RANDOM_COMMIT_COUNT=$(( ( RANDOM % 4 ) + 1 ))

### ========== QUOTES ========== ###
QUOTES=(
"The future depends on what you do today."
"Consistency beats motivation."
"Work hard in silence; success makes the noise."
"Push until something happens."
"Small progress is still progress."
"Discipline creates freedom."
"Your only limit is your mind."
"Winners don’t quit; quitters don’t win."
"Dream big. Start small. Act now."
"Every expert was once a beginner."
"Success is built daily."
"Focus on progress, not perfection."
"Hard days build strong people."
"Stay patient and trust your journey."
"Build something people remember."
"Code. Learn. Repeat."
"Great things take time."
"Your future self will thank you."
"One step every day."
"Done is better than perfect."
"Keep shipping."
"Growth happens outside comfort zones."
"Start before you are ready."
"Small wins become big victories."
"Never stop learning."
"Stay hungry. Stay foolish."
"Make today count."
"Action creates momentum."
"Success loves consistency."
"Create more than you consume."
)

### ========== CLONE IF NOT EXISTS ========== ###
if [ ! -d "$REPO_DIR" ]; then
    echo "📦 Repo not found. Cloning..."
    git clone "$REPO_URL" "$REPO_DIR"
fi

cd "$REPO_DIR" || exit 1

### ========== PICK RANDOM QUOTE ========== ###
RANDOM_INDEX=$(( RANDOM % ${#QUOTES[@]} ))
QUOTE="${QUOTES[$RANDOM_INDEX]}"

echo "$QUOTE" > "$QUOTE_FILE"

### ========== RANDOM MULTIPLE COMMITS ========== ###
for (( i=1; i<=RANDOM_COMMIT_COUNT; i++ ))
do
    echo "$QUOTE" >> "$QUOTE_FILE"

    git add "$QUOTE_FILE"

    git commit -m "Auto commit ($i/$RANDOM_COMMIT_COUNT): $QUOTE"
done

git push

echo "✔ Done — pushed $RANDOM_COMMIT_COUNT commits"
echo "📝 Generated Quote: $QUOTE"

### ======================================= ###
### INSTALL YOUR NPM PACKAGES (DOWNLOADS) ###
### ======================================= ###

echo ""
echo "📦 Installing npm packages..."

npm i port-fix-cli
npm i express-flex-file-server
npm i geometry-editor
npm i graphspace

echo ""
echo "✔ npm packages installed"

### ======================================= ###
### REMOVE PACKAGES AFTER INSTALL ###
### ======================================= ###

echo ""
echo "🗑 Removing installed packages..."

npm uninstall port-fix-cli
npm uninstall express-flex-file-server
npm uninstall geometry-editor
npm uninstall graphspace

echo ""
echo "✔ Packages removed"

### ======================================= ###
### ARGUMENT HANDLING ###
### ======================================= ###

if [ "$1" = "sd" ]; then
    echo "⚠ Shutdown requested. System will shut down in 5 seconds..."
    sleep 5
    shutdown -h now

elif [ "$1" = "ed" ]; then
    echo "🌐 Opening Microsoft Edge..."
    microsoft-edge >/dev/null 2>&1 &
    exit
fi

exit 0