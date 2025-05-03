{pkgs, ...}: {
  imports = [
    ./hyprlock.nix
    ./hypridle.nix
    ./hyprcursor.nix
  ];

  home.packages = with pkgs; [
    nautilus
    pamixer
    pavucontrol
    hyprshot
    hyprpicker
    # wf-recorder
    wlr-randr
    wl-clipboard
    brightnessctl
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    settings = {
      "$mod" = "SUPER";
      "$shiftMod" = "SUPER_SHIFT";

      source = [
        "/home/angerzen/.cache/wal/colors-hyprland.conf"
      ];

      exec-once = [
        "startup"
        "${pkgs.hypridle}/bin/hypridle"
        "exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "exec-once=waypaper --restore"
        "sleep 1 && swww init && sleep 1 && hyprlock && notify-send 'Hey $USER, Welcome back' &"
        "wl-paste --type text --watch cliphist store &"
        "wl-paste --type image --watch cliphist store &"
        "waybar &"
        "mako -c /home/angerzen/.cache/wal/mako.conf"
        "${pkgs.mate.mate-polkit}/libexec/polkit-mate-authentication-agent-1 &"
        "sleep 5 && vesktop --start-minimized &"
        "exec systemctl --user import-environment PATH"
        "systemctl --user restart xdg-desktop-portal.service"
      ];

      monitor = [",5120x2160@120,0x0,1"];

      bind = [
        "$mod, T, exec, ${pkgs.alacritty}/bin/alacritty"
        "$mod, E, exec, ${pkgs.nautilus}/bin/nautilus" #Nautilus
        "$mod, V, exec, ${pkgs.vivaldi}/bin/vivaldi" # Brave
        "$mod, L, exec, ${pkgs.hyprlock}/bin/hyprlock" # Lock
        "$mod, X, exec, powermenu" # Powermenu
        "$mod, R, exec, menu" # Launcher
        "$mod, S, layoutmsg, swapwithmaster master"
        "$mod, Q, killactive," # Close window
        "$mod, W, exec, ${pkgs.waypaper}/bin/waypaper"
        "$mod, Space, togglefloating," # Toggle Floating
        "$mod, F, fullscreen" # Toggle Fullscreen
        "$mod, left, movefocus, l" # Move focus left
        "$mod, right, movefocus, r" # Move focus Right
        "$mod, up, movefocus, u" # Move focus Up
        "$mod, down, movefocus, d" # Move focus Down
        "$mod, mouse_down, workspace, e-1"
        "$mod, mouse_up, workspace, e+1"
        # switch workspaces bindings
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        # move windows to workspace bindings
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"

        "$mod, P, exec, screenshot monitor" # Screenshot window
        "$shiftMod, PRINT, exec, screenshot window" # Screenshot monitor
        "$shiftMod, PRINT, exec, screenshot region" # Screenshot region
        "ALT, PRINT, exec, screenshot region swappy" # Screenshot region then edit
      ];
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      cursor = {no_hardware_cursors = true;};

      general = {
        resize_on_border = true;
        gaps_in = 4;
        gaps_out = 2;
        border_size = 2;
        "col.active_border" = "$color2";
        "col.inactive_border" = "$color3";
        layout = "master";
      };

      decoration = {
        rounding = 2;
        active_opacity = 0.98;
        inactive_opacity = 0.7;
        shadow = {
          enabled = true;
          ignore_window = true;
          offset = "0 8";
          range = 50;
          render_power = 3;
        };
        blur = {
          size = 3;
          passes = 2;
          new_optimizations = true;
          ignore_opacity = true;
          # noise = "0.18";
          contrast = "1";
          brightness = "0.9";
          xray = false;
        };
      };

      misc = {
        vfr = true;
        vrr = 1;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        disable_autoreload = true;
        enable_swallow = true;
        always_follow_on_dnd = true;
        animate_mouse_windowdragging = true;
        animate_manual_resizes = true;
      };

      dwindle = {
        force_split = 0;
        special_scale_factor = 1.0;
        split_width_multiplier = 1.0;
        use_active_for_splits = true;
        pseudotile = "yes";
        preserve_split = "yes";
      };

      master = {
        # new_status = "master";
        special_scale_factor = 0.8;
        allow_small_split = true;
        mfact = 0.45;
        orientation = "center";
        inherit_fullscreen = false;
      };

      opengl = {nvidia_anti_flicker = false;};

      input = {
        kb_layout = "us";
        kb_options = "caps:escape";
        follow_mouse = 1;
        sensitivity = 0.5;
        repeat_delay = 300;
        repeat_rate = 50;
        numlock_by_default = true;
      };

      windowrule = [
        "float,title:^(Volume Control)$"
      ];

      windowrulev2 = [
        "float, title:^(Picture-in-Picture)$"
        "opacity 1.0 override 1.0 override, title:^(Picture-in-Picture)$"
        "pin, title:^(Picture-in-Picture)$"
        "float, title:Bluetooth Devices"
        "move 20% 20%, title:Bluetooth Devices"
        "size 60% 60%, title:Bluetooth Devices"
      ];

      animations = let
        animationSpeed = "fast";

        animationDuration =
          if animationSpeed == "slow"
          then "4"
          else if animationSpeed == "medium"
          then "2.5"
          else "1.5";
        borderDuration =
          if animationSpeed == "slow"
          then "10"
          else if animationSpeed == "medium"
          then "6"
          else "3";
      in {
        enabled = true;
        bezier = [
          "linear, 0, 0, 1, 1"
          "md3_standard, 0.2, 0, 0, 1"
          "md3_decel, 0.05, 0.7, 0.1, 1"
          "md3_accel, 0.3, 0, 0.8, 0.15"
          "overshot, 0.05, 0.9, 0.1, 1.1"
          "crazyshot, 0.1, 1.5, 0.76, 0.92"
          "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
          "menu_decel, 0.1, 1, 0, 1"
          "menu_accel, 0.38, 0.04, 1, 0.07"
          "easeInOutCirc, 0.85, 0, 0.15, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutExpo, 0.16, 1, 0.3, 1"
          "softAcDecel, 0.26, 0.26, 0.15, 1"
          "md2, 0.4, 0, 0.2, 1"
        ];

        animation = [
          "windows, 1, ${animationDuration}, md3_decel, popin 60%"
          "windowsIn, 1, ${animationDuration}, md3_decel, popin 60%"
          "windowsOut, 1, ${animationDuration}, md3_accel, popin 60%"
          "border, 1, ${borderDuration}, default"
          "fade, 1, ${animationDuration}, md3_decel"
          "layersIn, 1, ${animationDuration}, menu_decel, slide"
          "layersOut, 1, ${animationDuration}, menu_accel"
          "fadeLayersIn, 1, ${animationDuration}, menu_decel"
          "fadeLayersOut, 1, ${animationDuration}, menu_accel"
          "workspaces, 1, ${animationDuration}, menu_decel, slide"
          "specialWorkspace, 1, ${animationDuration}, md3_decel, slidevert"
        ];
      };
    };
    # extraConfig = "general:col.active_border = $color2 $color3 $color4 $color5 45deg";
  };
}
