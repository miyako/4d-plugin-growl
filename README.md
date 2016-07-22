4d-plugin-growl
===============

4D plugin to display Growl notification.

##Platform

| carbon | cocoa | win32 | win64 |
|:------:|:-----:|:---------:|:---------:|
|🆗|🆗|🚫|🚫|

##About

This plugin is based on the [Growl-2.0.1-SDK](http://growl.info).

**Note**: You can replace the Framework inside the plugin with the one inside the ``Legacy`` folder, in which the ``1.2.3`` framework will be used. The old framework does not support the system Notification Center.

Commands
---

```
Growl Set notification method
Growl SET MIST ENABLED
Growl Get mist enabled
Growl POST NOTIFICATION
Growl Get notification method
```

##Example

```
Growl SET NOTIFICATION METHOD ("cb")
$method:=Growl Get notification method 

$title:="TITLE"
$description:="description"

READ PICTURE FILE(Get 4D folder(Current resources folder)+"4D-main.png";$icon)
$priority:=0  //-2 to 2
$sticky:=1
$context:="wawawa"
$identifier:="callback1"

Growl POST NOTIFICATION ($title;$description;$icon;$priority;$sticky;$context;$identifier)
```

###Callback

```
C_LONGINT($1;$type)
C_TEXT($2;$clickContext)

$type:=$1
$clickContext:=$2

Case of 
: ($type=0)  //clicked

: ($type=1)  //cancelled

End case 

TRACE
```
