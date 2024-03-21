{ config, lib, pkgs, modulesPath, ... }:

{
 fileSystems."/home/moon/Documents/Drive-C" =
    { device = "/dev/disk/by-uuid/df9c6833-7791-4a58-8b23-c6ce2cbdef4c";
      fsType = "auto";
    };

  fileSystems."/home/moon/Documents/Drive-B" =
    { device = "/dev/disk/by-uuid/2974ed0a-3e39-4a97-a18a-f172706a7e29";
      fsType = "ext4";
    };

  fileSystems."/home/moon/Documents/Drive-A" =
    { device = "/dev/disk/by-uuid/29030950-b57e-4be0-85ce-2e898674d863";
      fsType = "ext4";
    };
}
