#!/bin/bash
# Backup local directories to Google Drive via rclone
# Usage: backup-gdrive.sh <source-directory> [folder-name-on-drive]
#
# Examples:
#   backup-gdrive.sh ~/Documents/Notes
#   backup-gdrive.sh ~/Documents/Notes "My-Notes"
#   backup-gdrive.sh ~/projects "Projects"
#
# If folder name is omitted, the source directory name is used.
# All backups are stored under "Backups/" on Google Drive.
#
# Setup (run once):
#   1. rclone config create gdrive drive scope drive
#   2. crontab -e
#      */30 * * * * ~/.local/bin/backup-gdrive.sh ~/Documents/Notes "My-Notes"

set -euo pipefail

LOG_FILE="/tmp/backup-gdrive.log"
REMOTE="gdrive"
BACKUP_ROOT="Backups"

if [ $# -lt 1 ]; then
    echo "Usage: $(basename "$0") <source-directory> [folder-name-on-drive]"
    exit 1
fi

SOURCE="$1"
DRIVE_FOLDER="${2:-$(basename "$SOURCE")}"
DEST="${REMOTE}:${BACKUP_ROOT}/${DRIVE_FOLDER}"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [$DRIVE_FOLDER] $1" >> "$LOG_FILE"
}

if [ ! -d "$SOURCE" ]; then
    log "ERROR: Source directory not found: $SOURCE"
    exit 1
fi

log "Starting backup: $SOURCE -> $DEST"
rclone sync "$SOURCE" "$DEST" \
    --exclude=".obsidian/workspace.json" \
    --exclude=".trash/**" \
    --log-level INFO \
    >> "$LOG_FILE" 2>&1

log "Backup completed successfully."
