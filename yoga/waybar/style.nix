{ config, ... }:
let custom = {
  font = "Jetbrains Mono";
  font_size = "16px";
  background = "1D2433";
};
in 
{
  programs.waybar.style = ''
#waybar {
  background: #${custom.background};
  font-family: ${custom.font};
  font-size: ${custom.font_size};
}

/* padding */

#workspaces,
#network,
#backlight,
#pulseaudio,
#wireplumber.output,
#wireplumber.input,
#language,
#clock,
#language,
#battery {
  padding: 6px 10px;
}
#workspaces {
  padding-left: 20px;
}

#battery {
  margin-right: 20px;
}

/* workspaces */

#workspaces button {
  font-size: ${custom.font_size};
  padding: 0 1px;
  color: #${config.colorScheme.palette.base03};
  border: none;
}

#workspaces button.active {
  color: #${config.colorScheme.palette.base0D};
}

#workspaces button.urgent {
  color: #${config.colorScheme.palette.base08};
}

#workspaces button:hover {
  background: none;
  color: #${config.colorScheme.palette.base0E}; 
}
  '';
}
