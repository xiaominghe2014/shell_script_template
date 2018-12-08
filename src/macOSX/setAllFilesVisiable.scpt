(*功能：设置隐藏文件是否可见
  描述：在mac上可以直接运行生成桌面应用
*)
display dialog "隐藏/显示隐藏文件" buttons {"可见", "隐藏"} with icon 2 with title "Switch to presentation mode" default button 1

set switch to button returned of result

if switch is "隐藏" then
	do shell script "defaults write com.apple.finder AppleShowAllFiles -bool false;
KillAll Finder"
	
else
	do shell script "defaults write com.apple.finder AppleShowAllFiles -bool true;
KillAll Finder"
	
end if
