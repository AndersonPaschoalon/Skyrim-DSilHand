# Load DLC content on Creation Kit

When you try to load dawnguard, the creation kit may crash displaying a message with the message "Strings/Dawnguard_English.strings".

To fix it, go to the file `SkyrimEditor.ini` on Skyrim instalation folder, and add/edit the following key under the General section:

```
[General]
bAllowMultipleMasterLoads=1
```

Than, add the following key, under the Archive section. Add the plugins you want to load. If you want to load all DLCs, use:

```
[Archive]
SResourceArchiveList2=Skyrim - Shaders.bsa, Update.bsa, Dawnguard.bsa, HearthFires.bsa, Dragonborn.bsa
```

If you want to load only Dawnguard, use:

```
[Archive]
SResourceArchiveList2=Skyrim - Shaders.bsa, Update.bsa, Dawnguard.bsa
```

and so on.
