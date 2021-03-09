<h1> Linux config (March 2021) </h1>

Backup of personal system config.

<h3> Post-installation setup: </h3>

<p>
    After a barebones installation, do the following:
</p>
<ul>
  <li><b>Add sudoer user:</b>
  <li><code># useradd -m -G wheel glenn</code>
  <li><code># pacman -S sudo</code>
  <li>Uncomment <code># %wheel ALL=...</code> from /etc/sudoers
  <li><code># login</code>
  <li><b>Install yaourt:</b>
  <li><code>$ sudo pacman -S base-devel git wget yajl</code>
  <li><code>$ git clone https://aur.archlinux.org/package-query.git</code>
  <li><code>$ git clone https://aur.archlinux.org/yaourt.git</code>
  <li>For each, do <code>cd $NAME && makepkg -si</code>
  <li>For each, do <code>rm -rf $NAME</code>
  <li><b>Install window manager toppings:</b>
  <li>Install xf86-video-noveau, xorg
  <li>Add <code>exec i3</code> to ~/.xinitrc
  <li><code>$ cp /etc/i3/config ~/.config/i3/config</code> (Touch directory)
  <li>Install kitty and edit i3-config to launch it
  <li>Get i3-gaps, lemonbar, xcwd with yaourt
  <li>Install ttf-fira-code with yaourt
  <li><code>$ startx</code>
  <li>Use ctrl+shit+f2 to set font in kitty config:
  <li><code>font_family firacode</code>
  <li>Install feh
  <li><b>Install base16-colors for vim:</b>
  <li><code>$ cd ~/.vim/colors</code>
  <li><code>$ git clone git://github.com/chriskempson/base16-vim.git base16</code>
  <li><code>$ cp base16/colors/\*.vim .</code>
  <li><b>Install Plug and Julia support for vim:</b>
  <li>See <a href="https://github.com/junegunn/vim-plug">here for plug</a>
  <li> Add <code>Plug 'JuliaEditorSupport/julia-vim'</code> to ~/.vimrc Plug section
  <li> Run <code>:PlugInstall</code> in vim
  <li><b>Setup sound</b>
  <li>Install alsa, amixer, pulseaudio
  <li>Install pavucontrol and enable audiobox (desktop)
  <li>Follow <a href="https://medium.com/@gamunu/enable-high-quality-audio-on-linux-6f16f3fe7e1f">these</a> steps
</ul>
