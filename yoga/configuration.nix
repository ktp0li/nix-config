{ pkgs, ... }:
{
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;

fileSystems = {
  "/".options = [ "subvol=nixos" "compress=zstd" ];
  "/nix".options = [ "subvol=nixos/nix" "compress=zstd" ];
  "/home".options = [ "subvol=nixos/home" "compress=zstd" "noatime" ];
};

networking.hostName = "yoga";

time.timeZone = "Europe/Moscow";

security.rtkit.enable = true;
services.pipewire = {
  enable = true;
  alsa.enable = true;
  alsa.support32Bit = true;
  pulse.enable = true;
};

users.users.ktp0li = {
  name = "ktp0li";
  home = "/home/ktp0li";
  isNormalUser = true;
  extraGroups = [ "wheel" "video" ]; 
  shell = pkgs.fish;
};

home-manager.users.ktp0li = {
  home.username = "ktp0li";
  home.homeDirectory = "/home/ktp0li";
  home.stateVersion = "23.11";
};

 environment.systemPackages = with pkgs; [
   vim 
   wget
   sudo
   pipewire
];

fonts.packages = with pkgs; [
  jetbrains-mono
  #(nerdfonts.override { fonts = [ "JetBrainsMono"]; })
  nerd-fonts.jetbrains-mono
  noto-fonts
  noto-fonts-cjk-sans
];

programs.fish.enable = true;
programs.hyprland.enable = true;
environment.sessionVariables.NIXOS_OZONE_WL = "1";

system.stateVersion = "23.11"; 

nixpkgs.config.allowUnfree = true;

}

