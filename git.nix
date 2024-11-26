{ pkgs, ... }:
{
    programs.git = {
        enable = true;
        userName = "Polina Katunina";
        includes = [
            {
                condition = "gitdir:~/.config/";
                contents.user = {
                    email = "katunina0polina@gmail.com";
                };
            }
            {
                condition = "gitdir:~/private/";
                contents.user = {
                    email = "katunina0polina@gmail.com";
                };
            }
            {
                condition = "gitdir:~/work/";
                contents.user = {
                    email = "p.katunina@tbank.ru";
                };
            }
        ];
    };
}
