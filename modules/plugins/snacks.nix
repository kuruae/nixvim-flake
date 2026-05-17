{ pkgs, ... }:
{
  plugins.snacks = {
    enable = true;
    settings = {
      dashboard = {
        enable = true;
        width = 50;
        sections = [
          {
            section = "terminal";
            cmd = "${pkgs.writeShellScript "pokevim" (builtins.readFile ../../pokevim.sh)} ; sleep infinity";
            padding = 4;
            indent = 1;
            height = 16;
            align = "center";
            ttl = 1200;
          }
          {
            section = "keys";
            title = " ";
            items = [
              {
                key = "f";
                desc = "Find File";
                action = ":lua Snacks.picker.files()";
              }
              {
                key = "n";
                desc = "New File";
                action = ":ene | startinsert";
              }
              {
                key = "q";
                desc = "Quit";
                action = ":qa";
              }
            ];
          }
        ];
      };
      picker = {
        enabled = true;
        ui_select = true;
      };
      indent = {
        enabled = true;
        animate.enabled = false;
        scope.enabled = false;
      };
      notifier = {
        enabled = true;
        timeout = 3000;
        style = "compact";
      };
      words.enabled = true;
      statuscolumn.enabled = true;
      scroll.enabled = true;
      terminal.enabled = false;
      zen.enabled = false;
    };
  };
}
