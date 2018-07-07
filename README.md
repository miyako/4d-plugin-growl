4d-plugin-growl
===============

4D plugin to display [Growl](http://growl.info) notification.

### Platform

| carbon | cocoa | win32 | win64 |
|:------:|:-----:|:---------:|:---------:|
|<img src="https://cloud.githubusercontent.com/assets/1725068/22371562/1b091f0a-e4db-11e6-8458-8653954a7cce.png" width="24" height="24" />|<img src="https://cloud.githubusercontent.com/assets/1725068/22371562/1b091f0a-e4db-11e6-8458-8653954a7cce.png" width="24" height="24" />|||

### Version

<img src="https://cloud.githubusercontent.com/assets/1725068/18940649/21945000-8645-11e6-86ed-4a0f800e5a73.png" width="32" height="32" /> <img src="https://cloud.githubusercontent.com/assets/1725068/18940648/2192ddba-8645-11e6-864d-6d5692d55717.png" width="32" height="32" /> <img src="https://user-images.githubusercontent.com/1725068/41266195-ddf767b2-6e30-11e8-9d6b-2adf6a9f57a5.png" width="32" height="32" />

### Releases

[2.0.3](https://github.com/miyako/4d-plugin-growl/releases/tag/2.0.3)

![preemption xx](https://user-images.githubusercontent.com/1725068/41327179-4e839948-6efd-11e8-982b-a670d511e04f.png)

except 

* ``Growl POST NOTIFICATION``

[1.3](https://github.com/miyako/4d-plugin-growl/releases/tag/1.3) with mist (unstable)

## About

This plugin is based on the [Growl-2.0.1-SDK](http://growl.info).

If you don't have Growl running, or if you have configured Growl to used the Notification Center, a system notification will be posted instead.

<img width="300" alt="2016-07-22 18 10 34" src="https://cloud.githubusercontent.com/assets/1725068/17052278/b9192fc0-5037-11e6-9ab3-1456d172f771.png">

Unlike the ``DISPLAY NOTIFICATION`` command of 4D, the notification will always be displayed, even if the application is running as the frontmost. However, you have less control of the icon if you don't use Growl; the icon is decided by the application name.

<img width="310" alt="screenshot" src="https://user-images.githubusercontent.com/1725068/41230015-2e928616-6db9-11e8-93ef-2fbf4c49f057.png">

On the other hand, with Growl you can specify the icon image. You can also handle click events on the notification.

## Syntax

```
Growl POST NOTIFICATION (title;description;icon;priority;sticky;context;identifier)
```

Parameter|Type|Description
------------|------------|----
title|TEXT|
description|TEXT|
icon|PICTURE|
priority|LONGINT|
sticky|LONGINT|
context|TEXT|
identifier|TEXT|

```
enabled:=Growl Get mist enabled
Growl SET MIST ENABLED (enabled)
```

Parameter|Type|Description
------------|------------|----
enabled|LONGINT|``1`` or ``0``

```
method:=Growl Get notification method
Growl SET NOTIFICATION METHOD (method)
```

Parameter|Type|Description
------------|------------|----
method|TEXT|

## Examples

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

### Description

A new local process is launched to execute the callback method. Use the ``context`` string to keep track of which notification was clicked. The ``identifier`` can be used to group related notifications.

### Callback

```
C_LONGINT($1;$type)
C_TEXT($2;$clickContext)

$type:=$1
$clickContext:=$2

Case of 
: ($type=Growl Notification Clicked)

: ($type=Growl Notification Timeout)

End case 

TRACE
```
