{ pkgs, ... }:
{
    programs.git = {
        enable = true;
        includes = [
            {
                condition = "gitdir:~/.config/";
                contents.user = {
                    email = "katunina0polina@gmail.com";
                    name = "Polina Katunina";
                };
            }
        ];
    };
}