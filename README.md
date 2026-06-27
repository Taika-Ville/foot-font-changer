# foot-font-changer
foot font changer

First, ensure you have fzf installed:  
sudo pacman -S fzf  

Then, add this function to your ~/.bashrc (or ~/.zshrc):

```
footfont() {
    # 1. Get a clean list of all installed font families, pipe to fzf for selection
    local chosen_font=$(fc-list : family | cut -d, -f1 | sort -u | fzf --prompt="Select Foot Font: ")
    
    # 2. If a font was chosen, apply it to foot.ini
    if [ -n "$chosen_font" ]; then
        sed -i "s/^font=.*/font=$chosen_font:size=14/" ~/.config/foot/foot.ini
        echo "Font changed to: $chosen_font"
    fi
}
```

Restart your shell (or run source ~/.bashrc).  
Type footfont and press Enter.  
Start typing "ubuntu" (or any other name). It will filter your installed fonts in real-time.  
Hit Enter on the one you want, and your Foot terminal will instantly update to use it!
