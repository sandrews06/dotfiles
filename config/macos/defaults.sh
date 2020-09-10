#!/usr/bin/env bash

osascript -e 'tell application "System Preferences" to quit'


###############################################################################
# General UI/UX & Settings                                                    #
###############################################################################

# set Timezone
sudo systemsetup -settimezone "America/Toronto" > /dev/null

# always on
sudo systemsetup -setsleep Never

# expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# show date in menu clock
defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM HH:mm"


###############################################################################
# Keyboard & Input                                                            #
###############################################################################

# disable smart quotes, smart dots and dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false


###############################################################################
# Trackpad, mouse, Bluetooth accessories                                      #
###############################################################################

# disable natural scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

###############################################################################
# Screen                                                                      #
###############################################################################

# require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# enable snap-to-grid for icons on the desktop
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

###############################################################################
# Finder                                                                      #
###############################################################################

# finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# when performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# fisable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# always open everything in Finder's list view
# use list view in all Finder windows by default
# four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# show the ~/Library folder
chflags nohidden ~/Library

###############################################################################
# Dock                                                                        #
###############################################################################

# use scale effect for minimizing applications
defaults write com.apple.dock mineffect -string scale

# minimize dock items to their applications
defaults write com.apple.dock minimize-to-application -bool true

# show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# disable automatically hide and show the Dock
defaults write com.apple.dock autohide -bool false
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock autohide-delay -float 0


# no bouncing icons
defaults write com.apple.dock no-bouncing -bool true

# disable hot corners
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-br-corner -int 0

# don't show recently used applications in the Dock
defaults write com.Apple.Dock show-recents -bool false

###############################################################################
# Terminal                                                                    #
###############################################################################

# only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# appearance
defaults write com.apple.terminal "Default Window Settings" -string "Pro"
defaults write com.apple.terminal "Startup Window Settings" -string "Pro"
defaults write com.apple.Terminal ShowLineMarks -int 0

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

###############################################################################
# Activity Monitor                                                            #
###############################################################################

# show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

###############################################################################
# Photos                                                                      #
###############################################################################

# prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

###############################################################################
# TextEdit                                                                      #
###############################################################################

# use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

# open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

###############################################################################
# Messages                                                                    #
###############################################################################

# disable smart quotes as it’s annoying for messages that contain code
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false


echo "Done. Note that some of these changes require a logout/restart to take effect."

